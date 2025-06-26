// lib/controllers/filterctrl.dart
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

 
  final List<Function()> _disposers = []; 

  @override
  void onInit() {
    super.onInit();
    _loginController = Get.find<LoginController>();

    _initializeAllRestaurants();

    searchInputController.addListener(_onSearchInputChanged);

   
    ever(_loginController.userId, (_) {
      _initializeAllRestaurants();
      applyFilters();
    });
    ever(_loginController.userFavoriteList, (_) {
      _initializeAllRestaurants();
      applyFilters();
    });
    
    applyFilters();
  }

 
  void _initializeAllRestaurants() {
   
    _disposers.forEach((disposer) => disposer());
    _disposers.clear();

    final List<Restaurant> tempRestaurants = Reslist.restaurantList.map((map) {
       
        final bool isCurrentlyFavorite = _loginController.isLoggedIn.value &&
                                         _loginController.userFavoriteList.contains(map['id']);
       
        return Restaurant.fromMap({...map, 'isFavorite': isCurrentlyFavorite});
    }).toList();

    allRestaurantsObservable.assignAll(tempRestaurants);

   
    allRestaurantsObservable.forEach((restaurant) {
     
      _disposers.add(ever(restaurant.isFavorite, (_) {
        print("Restaurant ${restaurant.restaurantName} isFavorite changed to ${restaurant.isFavorite.value}. Re-applying filters...");
        applyFilters();
                       
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
    _disposers.forEach((disposer) => disposer());
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
      
     
      if (restaurantToUpdate.isFavorite.value) {
        _loginController.userFavoriteList.addIf(!_loginController.userFavoriteList.contains(restaurantId), restaurantId);
      } else {
        _loginController.userFavoriteList.remove(restaurantId);
      }
     
    }
  }

 
  void updateRestaurantStatus(String id, bool newStatus) {
    final int index = allRestaurantsObservable.indexWhere((res) => res.id == id);
    if (index != -1) {
      allRestaurantsObservable[index].isOpen.value = newStatus;
     
    }
  }

 
  void updateRestaurantInList(Restaurant updatedRestaurant) {
    final int index = allRestaurantsObservable.indexWhere((res) => res.id == updatedRestaurant.id);
    if (index != -1) {
     
      allRestaurantsObservable[index] = updatedRestaurant;
     
     
      applyFilters();
    }
  }

 
  void applyFilters() {
   
    List<Restaurant> tempFilteredRestaurants = List.from(allRestaurantsObservable);

   
    if (searchQuery.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) =>
              restaurant.restaurantName.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
              restaurant.description.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }

   
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

   
    if (selectedCategory.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) =>
              restaurant.type.toLowerCase().contains(selectedCategory.value.toLowerCase()))
          .toList();
    }
    filteredRestaurantList.value = tempFilteredRestaurants;


   
    List<Restaurant> tempFilteredFavorites = allRestaurantsObservable.where((restaurant) {
     
      return _loginController.isLoggedIn.value &&
             _loginController.userFavoriteList.contains(restaurant.id);
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
    void removeRestaurantFromList(String id) {
    print("FilterController: Attempting to remove restaurant with ID: $id");
    allRestaurantsObservable.removeWhere((restaurant) => restaurant.id == id);
    print("FilterController: Restaurants left after removal: ${allRestaurantsObservable.length}");
    applyFilters();
  }
}