import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/filterctrl.dart';
import 'package:food_near_me_app/controllers/detailctrl.dart'; // เพิ่ม import เพื่อเรียกใช้ RestaurantDetailController
import '../model/restaurant.dart';

class EditRestaurantDetailsController extends GetxController {
  final String restaurantId;
  late final FilterController _filterController;

  final Rx<Restaurant?> restaurantToEdit = Rx<Restaurant?>(null);

  final restaurantNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final openingHoursController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final locationController = TextEditingController();
  final menuImageController = TextEditingController();
  final bannerImageController = TextEditingController();
  final typeController = TextEditingController();

  final RxBool isLoading = false.obs;

  EditRestaurantDetailsController({required this.restaurantId});

  @override
  void onInit() {
    super.onInit();
    _filterController = Get.find<FilterController>();
    _loadRestaurantData();
  }

  @override
  void onClose() {
    restaurantNameController.dispose();
    descriptionController.dispose();
    openingHoursController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
    menuImageController.dispose();
    bannerImageController.dispose();
    typeController.dispose();
    super.onClose();
  }

  void _loadRestaurantData() {
    final foundRestaurant = _filterController.allRestaurantsObservable
        .firstWhereOrNull((res) => res.id == restaurantId);

    if (foundRestaurant != null) {
      restaurantToEdit.value = foundRestaurant;
      restaurantNameController.text = foundRestaurant.restaurantName;
      descriptionController.text = foundRestaurant.description;
      openingHoursController.text = foundRestaurant.openingHours;
      phoneNumberController.text = foundRestaurant.phoneNumber;
      locationController.text = foundRestaurant.location;
      menuImageController.text = foundRestaurant.menuImage;
      bannerImageController.text = foundRestaurant.bannerImage;
      typeController.text = foundRestaurant.type;
    } else {
      Get.snackbar('ข้อผิดพลาด', 'ไม่พบข้อมูลร้านค้าสำหรับการแก้ไข',
          snackPosition: SnackPosition.TOP);
      Get.back();
    }
  }

  // *** จุดแก้ไขสำคัญ: ปรับปรุง Logic การบันทึกและอัปเดตข้อมูล ***
  Future<void> saveChanges() async {
    if (restaurantToEdit.value == null) {
      Get.snackbar('ข้อผิดพลาด', 'ไม่สามารถบันทึก: ไม่พบข้อมูลร้านค้า',
          snackPosition: SnackPosition.TOP);
      return;
    }

    if (restaurantNameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        openingHoursController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        locationController.text.isEmpty ||
        typeController.text.isEmpty) {
      Get.snackbar('ข้อผิดพลาด', 'กรุณากรอกข้อมูลให้ครบถ้วน',
          snackPosition: SnackPosition.TOP);
      return;
    }

    isLoading.value = true;

    // สร้างข้อมูลร้านค้าที่อัปเดตแล้ว
    final updatedRestaurant = restaurantToEdit.value!.copyWith(
      restaurantName: restaurantNameController.text,
      description: descriptionController.text,
      openingHours: openingHoursController.text,
      phoneNumber: phoneNumberController.text,
      location: locationController.text,
      menuImage: menuImageController.text,
      bannerImage: bannerImageController.text,
      type: typeController.text,
    );

    // 1. อัปเดตข้อมูลใน List กลาง
    _filterController.updateRestaurantInList(updatedRestaurant);

    // 2. สั่งให้ Controller ของหน้ารายละเอียดโหลดข้อมูลใหม่ (สำคัญมาก)
    if (Get.isRegistered<RestaurantDetailController>(tag: restaurantId)) {
      final detailController = Get.find<RestaurantDetailController>(tag: restaurantId);
      detailController.restore();
    }

    // หน่วงเวลาเล็กน้อยเพื่อให้ UI ตอบสนอง
    await Future.delayed(const Duration(milliseconds: 100));
    isLoading.value = false;

    // 3. ย้อนกลับไปหน้ารายละเอียด
    Get.back();

    // 4. แสดง Snackbar เพื่อยืนยัน
    Get.snackbar(
      'สำเร็จ',
      'บันทึกข้อมูลร้านค้าเรียบร้อยแล้ว',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green[400],
      colorText: Colors.white,
    );
  }
}
