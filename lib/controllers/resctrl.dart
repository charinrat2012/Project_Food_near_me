import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';

import 'package:food_near_me_app/widgets/matwid/reslist.dart';

class RestaurantController extends GetxController {
  final LoginController _loginController = Get.find<LoginController>();

  final RxList<Map<String, dynamic>> allRestaurants =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

    allRestaurants.assignAll(Reslist.restaurantList);
  }

  List<Map<String, dynamic>> get favoriteRestaurants {
    if (!_loginController.isLoggedIn.value) return [];
    List<String> userFavIds = _loginController.userFavoriteList.value;
    return allRestaurants
        .where((res) => userFavIds.contains(res['id']))
        .toList();
  }

  bool isFavorite(String restaurantId) {
    if (!_loginController.isLoggedIn.value) return false;
    return _loginController.userFavoriteList.contains(restaurantId);
  }

  void toggleFavorite(String restaurantId) {
    if (!_loginController.isLoggedIn.value) {
      Get.snackbar(
        'ข้อผิดพลาด',
        'กรุณาล็อกอินเพื่อใช้ฟังก์ชันนี้',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }
    if (_loginController.userFavoriteList.contains(restaurantId)) {
      _loginController.userFavoriteList.remove(restaurantId);
    } else {
      _loginController.userFavoriteList.add(restaurantId);
    }
  }
}
