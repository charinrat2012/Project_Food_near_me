// lib/controllers/filterctrl.dart
import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/homewid/localist.dart';
import 'package:get/get.dart'; // *** ตรวจสอบให้แน่ใจว่า import นี้มีอยู่และถูกต้อง ***
import 'package:food_near_me_app/widgets/matwid/reslist.dart';

import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

import '../model/restaurant.dart';

class FilterController extends GetxController {
  final TextEditingController searchInputController = TextEditingController();
  final RxString searchQuery = ''.obs;
  final RxString selectedProvince = ''.obs;
  final RxString selectedDistrict = ''.obs;
  final RxString selectedCategory = ''.obs;

  late final LoginController _loginController;

  final RxList<Restaurant> allRestaurantsObservable = <Restaurant>[].obs;

  final RxList<Restaurant> filteredRestaurantList = <Restaurant>[].obs;
  final RxList<Restaurant> filteredFavoriteList = <Restaurant>[].obs;

  // สำหรับเก็บ ReactionDisposer เพื่อป้องกัน memory leaks
  // ReactionDisposer เป็น Type ที่มาจาก GetX
   final List<Function()> _disposers = []; 


  @override
  void onInit() {
    super.onInit();
    _loginController = Get.find<LoginController>();

    _initializeAllRestaurants(); // โหลดและตั้งค่า isFavorite เริ่มต้น

    searchInputController.addListener(_onSearchInputChanged);

    // เมื่อ userId หรือ userFavoriteList เปลี่ยน ให้เรียก _initializeAllRestaurants ใหม่
    ever(_loginController.userId, (_) {
      _initializeAllRestaurants(); // Re-initialize เพื่ออัปเดต isFavorite ตามผู้ใช้ใหม่
      applyFilters();
    });
    ever(_loginController.userFavoriteList, (_) {
      _initializeAllRestaurants(); // Re-initialize all restaurants because user favorite list has changed
      applyFilters(); // Re-apply filters after the base list is initialized
    });
    
    applyFilters(); // เรียก applyFilters ครั้งแรก
  }

  void _initializeAllRestaurants() {
    // กำจัด listeners เก่าทั้งหมดก่อนสร้างใหม่ เพื่อป้องกัน memory leaks และ listener ซ้ำซ้อน
    _disposers.forEach((disposer) => disposer()); // disposer() คือการเรียก ReactionDisposer ให้ทำงาน
    _disposers.clear();

    final List<Restaurant> tempRestaurants = Reslist.restaurantList.map((map) {
        final bool isCurrentlyFavorite = _loginController.isLoggedIn.value &&
                                         _loginController.userFavoriteList.contains(map['id']);
        return Restaurant.fromMap({...map, 'isFavorite': isCurrentlyFavorite});
    }).toList();

    allRestaurantsObservable.assignAll(tempRestaurants);

    // Setup new listeners for the newly assigned Restaurant objects
    allRestaurantsObservable.forEach((restaurant) {
      _disposers.add(ever(restaurant.isFavorite, (_) {
        print("Restaurant ${restaurant.restaurantName} isFavorite changed to ${restaurant.isFavorite.value}. Re-applying filters...");
        applyFilters(); // การอัปเดต isFavorite จะส่งผลให้ userFavoriteList เปลี่ยนและ trigger applyFilters() อยู่แล้ว
                        // แต่การเรียกตรงนี้อีกครั้งเป็นการยืนยันและทำให้แน่ใจว่า UI อัปเดต
      }));
      _disposers.add(ever(restaurant.isOpen, (_) {
          print("Restaurant ${restaurant.restaurantName} isOpen changed to ${restaurant.isOpen.value}. Re-applying filters...");
          applyFilters();
      }));
    });
  }

  @override
  void onClose() {
    searchInputController.removeListener(_onSearchInputChanged);
    searchInputController.dispose();
    _disposers.forEach((disposer) => disposer()); // กำจัด listeners เมื่อ Controller ปิด
    super.onClose();
  }

  void _onSearchInputChanged() {
    searchQuery.value = searchInputController.text;
    applyFilters();
  }

  void setSelectedProvince(String province) {
    selectedProvince.value = province;
    if (!province.isEmpty && !(Localist.districtsByProvince[province]?.contains(selectedDistrict.value) ?? false)) {
      selectedDistrict.value = '';
    } else if (province.isEmpty) {
      selectedDistrict.value = '';
    }
    applyFilters();
  }

  void setSelectedDistrict(String district) {
    selectedDistrict.value = district;
    applyFilters();
  }

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
    applyFilters();
  }

  void toggleFavorite(String restaurantId) {
    final int index = allRestaurantsObservable.indexWhere((res) => res.id == restaurantId);
    if (index != -1) {
      final Restaurant restaurantToUpdate = allRestaurantsObservable[index];
      restaurantToUpdate.isFavorite.value = !restaurantToUpdate.isFavorite.value;
      
      print("Favorite status of ${restaurantToUpdate.restaurantName} changed to ${restaurantToUpdate.isFavorite.value}");
      
      // อัปเดต userFavoriteList ใน LoginController ด้วย
      if (restaurantToUpdate.isFavorite.value) {
        _loginController.userFavoriteList.addIf(!_loginController.userFavoriteList.contains(restaurantId), restaurantId);
      } else {
        _loginController.userFavoriteList.remove(restaurantId);
      }
      // applyFilters() จะถูกเรียกอัตโนมัติจาก ever listener ของ _loginController.userFavoriteList
    }
  }

  void updateRestaurantStatus(String id, bool newStatus) {
    final int index = allRestaurantsObservable.indexWhere((res) => res.id == id);
    if (index != -1) {
      allRestaurantsObservable[index].isOpen.value = newStatus;
      // applyFilters() จะถูกเรียกอัตโนมัติจาก ever listener ของ isOpen
    }
  }

  void applyFilters() {
    List<Restaurant> tempFilteredRestaurants = List.from(allRestaurantsObservable);

    // การกรองตาม Search Query
    if (searchQuery.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) =>
              restaurant.restaurantName.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
              restaurant.description.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    // การกรองตามทำเล
    if (selectedProvince.value.isNotEmpty) {
        tempFilteredRestaurants = tempFilteredRestaurants
            .where((restaurant) {
                final restaurantLocation = restaurant.location.toLowerCase();
                final isProvinceMatch = restaurantLocation.contains(selectedProvince.value.toLowerCase());
                
                if (selectedDistrict.value.isNotEmpty) {
                    final isDistrictMatch = restaurantLocation.contains(selectedDistrict.value.toLowerCase());
                    return isProvinceMatch && isDistrictMatch;
                }
                return isProvinceMatch;
            })
            .toList();
    }

    // การกรองตามประเภท
    if (selectedCategory.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) =>
              restaurant.type.toLowerCase().contains(selectedCategory.value.toLowerCase()))
          .toList();
    }
    filteredRestaurantList.value = tempFilteredRestaurants;


    // การกรองสำหรับรายการร้านอาหารที่ชื่นชอบ (filteredFavoriteList)
    List<Restaurant> tempFilteredFavorites = allRestaurantsObservable.where((restaurant) {
      return _loginController.isLoggedIn.value &&
             _loginController.userFavoriteList.contains(restaurant.id); // กรองตาม ID ใน userFavoriteList
    }).toList();

    if (searchQuery.value.isNotEmpty) {
      tempFilteredFavorites = tempFilteredFavorites
          .where((restaurant) =>
              restaurant.restaurantName.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
              restaurant.description.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
    
    filteredFavoriteList.value = tempFilteredFavorites;
  }
}