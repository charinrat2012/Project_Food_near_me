import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/homewid/localist.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/widgets/matwid/reslist.dart';

import 'package:food_near_me_app/controllers/loginctrl.dart';

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

  @override
  void onInit() {
    super.onInit();
    _loginController = Get.find<LoginController>();

    _initializeAllRestaurants();

    searchInputController.addListener(_onSearchInputChanged);

    // เรายังต้องฟิลเตอร์ใหม่ เมื่อมีการ login/logout
    ever(_loginController.userId, (_) {
      _initializeAllRestaurants(); // รีเซ็ตสถานะ isFavorite ตาม user คนใหม่
      applyFilters();
    });

    applyFilters();
  }

  void _initializeAllRestaurants() {
    final List<Restaurant> tempRestaurants = Reslist.restaurantList.map((map) {
      final bool isCurrentlyFavorite = _loginController.isLoggedIn.value &&
          _loginController.userFavoriteList.contains(map['id']);
      return Restaurant.fromMap({...map, 'isFavorite': isCurrentlyFavorite});
    }).toList();

    allRestaurantsObservable.assignAll(tempRestaurants);
  }

  @override
  void onClose() {
    searchInputController.removeListener(_onSearchInputChanged);
    searchInputController.dispose();
    super.onClose();
  }

  void _onSearchInputChanged() {
    searchQuery.value = searchInputController.text;
    applyFilters();
  }

  void setSelectedProvince(String province) {
    selectedProvince.value = province;
    if (!province.isEmpty &&
        !(Localist.districtsByProvince[province]
                ?.contains(selectedDistrict.value) ??
            false)) {
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
    final int index =
        allRestaurantsObservable.indexWhere((res) => res.id == restaurantId);
    if (index != -1) {
      final Restaurant restaurantToUpdate = allRestaurantsObservable[index];
      
      // 1. สลับสถานะ isFavorite ใน object โดยตรง
      restaurantToUpdate.isFavorite.value = !restaurantToUpdate.isFavorite.value;

      // 2. อัปเดต list รายการโปรดของ user ใน LoginController
      if (restaurantToUpdate.isFavorite.value) {
        _loginController.userFavoriteList.add(restaurantId);
      } else {
        _loginController.userFavoriteList.remove(restaurantId);
      }

      // 3. เรียก applyFilters() เพื่ออัปเดต UI ของหน้ารายการโปรด
      applyFilters();
    }
  }

  void updateRestaurantStatus(String id, bool newStatus) {
    final int index =
        allRestaurantsObservable.indexWhere((res) => res.id == id);
    if (index != -1) {
      allRestaurantsObservable[index].isOpen.value = newStatus;
      applyFilters();
    }
  }

  void updateRestaurantInList(Restaurant updatedRestaurant) {
    final int index =
        allRestaurantsObservable.indexWhere((res) => res.id == updatedRestaurant.id);
    if (index != -1) {
      // แทนที่ object เดิมด้วย object ที่อัปเดตแล้ว
      // สำคัญ: ต้องรักษาสถานะ isFavorite และ isOpen ที่เป็น RxBool ไว้
      updatedRestaurant.isFavorite.value = allRestaurantsObservable[index].isFavorite.value;
      updatedRestaurant.isOpen.value = allRestaurantsObservable[index].isOpen.value;
      allRestaurantsObservable[index] = updatedRestaurant;
      applyFilters();
    }
  }

  void applyFilters() {
    List<Restaurant> tempFilteredRestaurants = List.from(allRestaurantsObservable);

    if (searchQuery.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) =>
              restaurant.restaurantName
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              restaurant.description
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
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
    filteredRestaurantList.value = tempFilteredRestaurants;

    List<Restaurant> tempFilteredFavorites =
        allRestaurantsObservable.where((restaurant) {
      return _loginController.isLoggedIn.value &&
          _loginController.userFavoriteList.contains(restaurant.id);
    }).toList();

    if (searchQuery.value.isNotEmpty) {
      tempFilteredFavorites = tempFilteredFavorites
          .where((restaurant) =>
              restaurant.restaurantName
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              restaurant.description
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    filteredFavoriteList.value = tempFilteredFavorites;
  }

  void removeRestaurantFromList(String id) {
    print("FilterController: Attempting to remove restaurant with ID: $id");
    allRestaurantsObservable.removeWhere((restaurant) => restaurant.id == id);
    print(
        "FilterController: Restaurants left after removal: ${allRestaurantsObservable.length}");
    applyFilters();
  }
}
