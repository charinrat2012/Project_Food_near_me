// lib/controllers/filter_controller.dart
import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/favoritwid/favlist.dart';
import 'package:food_near_me_app/widgets/homewid/localist.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/widgets/homewid/reslist.dart'; // *** นำเข้า Reslist ที่เก็บข้อมูลของคุณ ***

class FilterController extends GetxController {
  final TextEditingController searchInputController = TextEditingController();
  final RxString searchQuery = ''.obs;
final RxString selectedProvince = ''.obs; // สำหรับจังหวัดที่เลือก
  final RxString selectedDistrict = ''.obs; // สำหรับเขต/อำเภอที่เลือก
  final RxString selectedCategory = ''.obs; // สำหรับประเภทอาหารที่เลือก

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
    // filterRestaurantList('');

    // filterfavoriteList('');
    applyFilters();
  }

  @override
  void onClose() {
    searchInputController.removeListener(_onSearchInputChanged);
    searchInputController.dispose();
    super.onClose();
  }

  void _onSearchInputChanged() {
    searchQuery.value = searchInputController.text;
    // filterRestaurantList(searchQuery.value); 
     applyFilters();
  }
void setSelectedProvince(String province) {
    selectedProvince.value = province;
    // เมื่อจังหวัดเปลี่ยน ให้รีเซ็ตเขต/อำเภอที่เลือก (ถ้ามี)
    // เพื่อป้องกันการเลือกเขต/อำเภอที่ไม่อยู่ในจังหวัดใหม่
    if (!province.isEmpty && !(Localist.districtsByProvince[province]?.contains(selectedDistrict.value) ?? false)) {
        selectedDistrict.value = ''; // รีเซ็ตเขต/อำเภอถ้าจังหวัดเปลี่ยนและเขตเดิมไม่อยู่ในจังหวัดใหม่
    } else if (province.isEmpty) { // ถ้าเลือก "ทั้งหมด" สำหรับจังหวัด
      selectedDistrict.value = ''; // รีเซ็ตเขต/อำเภอ
    }
  }

  // --- ฟังก์ชันใหม่สำหรับเปลี่ยนประเภทอาหารที่เลือก ---
  void setSelectedDistrict(String district) {
    selectedDistrict.value = district;
    applyFilters();
  }
   void setSelectedCategory(String category) {
    selectedCategory.value = category;
    applyFilters();
  }
void applyFilters() {
    // กรองสำหรับรายการร้านอาหารทั่วไป
    List<Map<String, dynamic>> tempFilteredRestaurants = List.from(_originalRestaurantList);

    // กรองตามข้อความค้นหา (Search Query)
    if (searchQuery.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) =>
              (restaurant['restaurantName']?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false) ||
              (restaurant['description']?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false))
          .toList();
    }

    // กรองตามทำเล: จังหวัด (selectedProvince) และ เขต/อำเภอ (selectedDistrict)
    // การกรองควรเป็น "จังหวัด" AND "เขต/อำเภอ" (ถ้ามีเขต/อำเภอถูกเลือก)
    if (selectedProvince.value.isNotEmpty) {
        tempFilteredRestaurants = tempFilteredRestaurants
            .where((restaurant) {
                // สมมติว่า 'location' ในข้อมูลร้านอาหารมีทั้งจังหวัดและเขต/อำเภออยู่ใน String เดียวกัน
                // เช่น "กรุงเทพมหานคร เขตราชเทวี"
                final restaurantLocation = restaurant['location']?.toLowerCase() ?? '';
                final isProvinceMatch = restaurantLocation.contains(selectedProvince.value.toLowerCase());
                
                // ถ้ามี district ถูกเลือก ให้กรองตาม district ด้วย
                if (selectedDistrict.value.isNotEmpty) {
                    final isDistrictMatch = restaurantLocation.contains(selectedDistrict.value.toLowerCase());
                    return isProvinceMatch && isDistrictMatch;
                }
                return isProvinceMatch;
            })
            .toList();
    }

    // กรองตามประเภทอาหาร (selectedCategory)
    if (selectedCategory.value.isNotEmpty) {
      tempFilteredRestaurants = tempFilteredRestaurants
          .where((restaurant) =>
              (restaurant['type']?.toLowerCase().contains(selectedCategory.value.toLowerCase()) ?? false))
          .toList();
    }
    filteredRestaurantList.value = tempFilteredRestaurants;

 List<Map<String, dynamic>> tempFilteredFavorites = List.from(_favRestaurantList);

    if (searchQuery.value.isNotEmpty) {
      tempFilteredFavorites = tempFilteredFavorites
          .where((restaurant) =>
              restaurant['restaurantName']
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              restaurant['description']
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    
    filteredfavoriteList.value = tempFilteredFavorites;
  }


  // void filterRestaurantList(String query) {
  //   if (query.isEmpty) {
  //     // ถ้า query ว่างเปล่า ให้แสดงร้านอาหารต้นฉบับทั้งหมด
  //     filteredRestaurantList.value = List.from(_originalRestaurantList);
  //   } else {
  //     // กรองข้อมูลจากรายการต้นฉบับ
  //     filteredRestaurantList.value = _originalRestaurantList
  //         .where((restaurant) =>
  //             restaurant['restaurantName']
  //                 .toLowerCase()
  //                 .contains(query.toLowerCase()) ||
  //             restaurant['description']
  //                 .toLowerCase()
  //                 .contains(query.toLowerCase()))
  //         .toList();
  //   }
  // }
  //  void filterfavoriteList(String query) {
  //   if (query.isEmpty) {
  //     // ถ้า query ว่างเปล่า ให้แสดงร้านอาหารต้นฉบับทั้งหมด
  //     filteredfavoriteList.value = List.from(_favRestaurantList);
  //   } else {
  //     // กรองข้อมูลจากรายการต้นฉบับ
  //     filteredfavoriteList.value = _favRestaurantList
  //         .where((restaurant) =>
  //             restaurant['restaurantName']
  //                 .toLowerCase()
  //                 .contains(query.toLowerCase()) ||
  //             restaurant['description']
  //                 .toLowerCase()
  //                 .contains(query.toLowerCase()))
  //         .toList();
  //   }
  // }

  // คุณสามารถเพิ่ม logic การกรองอื่นๆ ได้ที่นี่ เช่น กรองตามทำเล หรือประเภทอาหาร
  // void filterByLocation(String location) { ... }
  // void filterByType(String type) { ... }
}