import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/home_widget/home_localist.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/widgets/material_widget/reslist.dart';

import 'package:food_near_me_app/controllers/login_ctrl.dart';

import '../model/restaurant.dart';

class FilterController extends GetxController {
  // สำหรับหน้า Home
  final TextEditingController homeSearchInputController = TextEditingController();
  final RxString homeSearchQuery = ''.obs;
  late FocusNode homeSearchFocusNode;

  // สำหรับหน้า Favorite
  final TextEditingController favSearchInputController = TextEditingController();
  final RxString favSearchQuery = ''.obs;
  late FocusNode favSearchFocusNode;

  final RxString selectedProvince = ''.obs;
  final RxString selectedDistrict = ''.obs;
  final RxString selectedCategory = ''.obs;
  final RxString openStatusFilter = 'all'.obs;

  late final LoginController _loginController;

  final RxList<Restaurant> allRestaurantsObservable = <Restaurant>[].obs;
  final RxList<Restaurant> filteredRestaurantList = <Restaurant>[].obs;
  final RxList<Restaurant> filteredFavoriteList = <Restaurant>[].obs;

  @override
  void onInit() {
    super.onInit();
    homeSearchFocusNode = FocusNode();
    favSearchFocusNode = FocusNode();
    _loginController = Get.find<LoginController>();

    // --- 1. เริ่มต้นข้อมูลร้านอาหารแค่ครั้งเดียว ---
    _initializeAllRestaurants();

    // --- Listener สำหรับการค้นหา ---
    homeSearchInputController.addListener(() {
      homeSearchQuery.value = homeSearchInputController.text;
      applyFilters();
    });

    favSearchInputController.addListener(() {
      favSearchQuery.value = favSearchInputController.text;
      applyFilters();
    });

    // --- 2. อัปเดตสถานะ Favorite โดยไม่รีเซ็ตข้อมูลทั้งหมด ---
    ever(_loginController.userFavoriteList, (_) => _updateFavoriteStatuses());
    
    // Listener สำหรับฟิลเตอร์อื่นๆ
    ever(openStatusFilter, (_) => applyFilters());
    ever(selectedProvince, (_) => applyFilters());
    ever(selectedDistrict, (_) => applyFilters());
    ever(selectedCategory, (_) => applyFilters());

    // เรียกใช้ฟิลเตอร์ครั้งแรก
    applyFilters();
  }

  void _initializeAllRestaurants() {
    final List<Restaurant> tempRestaurants = Reslist.restaurantList.map((map) {
      final bool isCurrentlyFavorite = _loginController.isLoggedIn.value &&
          _loginController.userFavoriteList.contains(map['id']);
      return Restaurant.fromMap({...map, 'isFavorite': isCurrentlyFavorite});
    }).toList();
    allRestaurantsObservable.assignAll(tempRestaurants);
    
    // ทำให้เมื่อสถานะ isOpen ของร้านเปลี่ยน จะมีการ filter ใหม่
    allRestaurantsObservable.forEach((restaurant) {
      ever(restaurant.isOpen, (_) => applyFilters());
    });
  }

  // --- ฟังก์ชันใหม่สำหรับอัปเดตสถานะ Favorite ---
  void _updateFavoriteStatuses() {
    for (var restaurant in allRestaurantsObservable) {
      final bool isFav = _loginController.userFavoriteList.contains(restaurant.id);
      if (restaurant.isFavorite.value != isFav) {
        restaurant.isFavorite.value = isFav;
      }
    }
    applyFilters();
  }


  @override
  void onClose() {
    homeSearchInputController.dispose();
    homeSearchFocusNode.dispose();
    favSearchInputController.dispose();
    favSearchFocusNode.dispose();
    super.onClose();
  }

  void clearSearchFocus(String page) {
    if (page == 'home' && homeSearchFocusNode.hasFocus) {
      homeSearchFocusNode.unfocus();
    } else if (page == 'favorite' && favSearchFocusNode.hasFocus) {
      favSearchFocusNode.unfocus();
    }
  }
  
  void setSelectedProvince(String province) {
    selectedProvince.value = province;
    if (!province.isEmpty && !(Localist.districtsByProvince[province]?.contains(selectedDistrict.value) ?? false)) {
      selectedDistrict.value = '';
    } else if (province.isEmpty) {
      selectedDistrict.value = '';
    }
  }

  void setSelectedDistrict(String district) {
    selectedDistrict.value = district;
  }

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }
  
  void toggleFavorite(String restaurantId) {
    if (!_loginController.isLoggedIn.value) {
      Get.snackbar('System', 'กรุณาเข้าสู่ระบบเพื่อใช้งาน');
      return;
    }
    // อัปเดต list ใน loginController โดยตรง ซึ่งจะไป trigger `ever`
    if (_loginController.userFavoriteList.contains(restaurantId)) {
      _loginController.userFavoriteList.remove(restaurantId);
    } else {
      _loginController.userFavoriteList.add(restaurantId);
    }
  }
  
  void updateRestaurantStatus(String id, bool newStatus) {
    final int index = allRestaurantsObservable.indexWhere((res) => res.id == id);
    if (index != -1) {
      allRestaurantsObservable[index].isOpen.value = newStatus;
      // applyFilters(); ไม่ต้องเรียกตรงนี้ เพราะ ever ใน init จัดการให้แล้ว
    }
  }

  void updateRestaurantInList(Restaurant updatedRestaurant) {
    final int index = allRestaurantsObservable.indexWhere((res) => res.id == updatedRestaurant.id);
    if (index != -1) {
      // ต้องมั่นใจว่า isFavorite และ isOpen ยังคงเป็น instance เดิม
      updatedRestaurant.isFavorite.value = allRestaurantsObservable[index].isFavorite.value;
      updatedRestaurant.isOpen.value = allRestaurantsObservable[index].isOpen.value;
      allRestaurantsObservable[index] = updatedRestaurant;
      applyFilters();
    }
  }

  void applyFilters() {
    // --- Filtering for Home Page ---
    List<Restaurant> tempFilteredRestaurants = List.from(allRestaurantsObservable);

    if (homeSearchQuery.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) =>
              restaurant.restaurantName
                  .toLowerCase()
                  .contains(homeSearchQuery.value.toLowerCase()) ||
              restaurant.description
                  .toLowerCase()
                  .contains(homeSearchQuery.value.toLowerCase()) ||
              restaurant.details
                  .toLowerCase()
                  .contains(homeSearchQuery.value.toLowerCase()) ||
              restaurant.type
                  .toLowerCase()
                  .contains(homeSearchQuery.value.toLowerCase()))
          .toList();
    }

    if (selectedProvince.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) {
            final restaurantLocation = restaurant.location.toLowerCase();
            final isProvinceMatch =
                restaurantLocation.contains(selectedProvince.value.toLowerCase());
            if (selectedDistrict.value.isNotEmpty) {
              final isDistrictMatch =
                  restaurantLocation.contains(selectedDistrict.value.toLowerCase());
              return isProvinceMatch && isDistrictMatch;
            }
            return isProvinceMatch;
          })
          .toList();
    }

    if (selectedCategory.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) => restaurant.type
              .toLowerCase()
              .contains(selectedCategory.value.toLowerCase()))
          .toList();
    }

    if (openStatusFilter.value == 'open') {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) => restaurant.isOpen.value)
          .toList();
    } else if (openStatusFilter.value == 'closed') {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) => !restaurant.isOpen.value)
          .toList();
    }

    filteredRestaurantList.value = tempFilteredRestaurants;

    // --- Filtering for Favorite Page ---
    List<Restaurant> tempFilteredFavorites =
        allRestaurantsObservable.where((restaurant) {
      return restaurant.isFavorite.value; // เช็คจาก state ของร้านโดยตรง
    }).toList();

    if (favSearchQuery.value.isNotEmpty) {
      tempFilteredFavorites = tempFilteredFavorites
          .where((restaurant) =>
              restaurant.restaurantName
                  .toLowerCase()
                  .contains(favSearchQuery.value.toLowerCase()) ||
              restaurant.description
                  .toLowerCase()
                  .contains(favSearchQuery.value.toLowerCase()) ||
              restaurant.details
                  .toLowerCase()
                  .contains(favSearchQuery.value.toLowerCase()) ||
              restaurant.type
                  .toLowerCase()
                  .contains(favSearchQuery.value.toLowerCase()))
          .toList();
    }
    filteredFavoriteList.value = tempFilteredFavorites;
  }

  void removeRestaurantFromList(String id) {
    allRestaurantsObservable.removeWhere((restaurant) => restaurant.id == id);
    applyFilters();
  }
}