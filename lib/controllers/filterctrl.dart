// lib/controllers/filter_controller.dart
import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/favoritwid/favlist.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/widgets/homewid/reslist.dart'; // *** นำเข้า Reslist ที่เก็บข้อมูลของคุณ ***

class FilterController extends GetxController {
  final TextEditingController searchInputController = TextEditingController();
  final RxString searchQuery = ''.obs;

  // รายการร้านอาหารต้นฉบับทั้งหมด (จะถูกดึงมาจาก Reslist)
  // กำหนดเป็น private เนื่องจากเป็นแหล่งข้อมูลภายใน
  late final List<Map<String, dynamic>> _originalRestaurantList;
  late final List<Map<String, dynamic>> _favRestaurantList;

  // รายการที่จะถูกแสดงผลใน UI ซึ่งจะอัปเดตตามการค้นหา/กรอง
  final RxList<Map<String, dynamic>> filteredRestaurantList = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredfavoriteList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // เริ่มต้น _originalRestaurantList จาก Reslist.restaurantList
    // ใช้ List.from() เพื่อสร้างสำเนาที่แก้ไขได้ ไม่ใช่การอ้างอิงตรงๆ
    _originalRestaurantList = List.from(Reslist.restaurantList);
    _favRestaurantList = List.from(Favlist.favlist);

    // เพิ่ม listener ให้กับ searchInputController
    searchInputController.addListener(_onSearchInputChanged);

    // กำหนด filteredRestaurantList เริ่มต้นให้แสดงร้านอาหารทั้งหมด
    filterRestaurantList('');

    filterfavoriteList('');
  }

  @override
  void onClose() {
    searchInputController.removeListener(_onSearchInputChanged);
    searchInputController.dispose();
    super.onClose();
  }

  void _onSearchInputChanged() {
    searchQuery.value = searchInputController.text;
    filterRestaurantList(searchQuery.value); // สั่งให้ทำการกรองเมื่อข้อความเปลี่ยน
  }

  void filterRestaurantList(String query) {
    if (query.isEmpty) {
      // ถ้า query ว่างเปล่า ให้แสดงร้านอาหารต้นฉบับทั้งหมด
      filteredRestaurantList.value = List.from(_originalRestaurantList);
    } else {
      // กรองข้อมูลจากรายการต้นฉบับ
      filteredRestaurantList.value = _originalRestaurantList
          .where((restaurant) =>
              restaurant['restaurantName']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              restaurant['description']
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
  }
   void filterfavoriteList(String query) {
    if (query.isEmpty) {
      // ถ้า query ว่างเปล่า ให้แสดงร้านอาหารต้นฉบับทั้งหมด
      filteredfavoriteList.value = List.from(_favRestaurantList);
    } else {
      // กรองข้อมูลจากรายการต้นฉบับ
      filteredfavoriteList.value = _favRestaurantList
          .where((restaurant) =>
              restaurant['restaurantName']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              restaurant['description']
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
  }

  // คุณสามารถเพิ่ม logic การกรองอื่นๆ ได้ที่นี่ เช่น กรองตามทำเล หรือประเภทอาหาร
  // void filterByLocation(String location) { ... }
  // void filterByType(String type) { ... }
}