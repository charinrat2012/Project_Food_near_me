// lib/controllers/editedetailctrl.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/filte_rctrl.dart';
import 'package:food_near_me_app/controllers/restaurant_detail_ctrl.dart';
import '../model/restaurant.dart';
import 'package:image_picker/image_picker.dart';
 // ต้อง import dart:io เพื่อใช้ File

// สร้าง enum เพื่อระบุประเภทของ Banner
enum BannerType { image, text }

class EditRestaurantDetailsController extends GetxController {
  final String restaurantId;
  late final FilterController _filterController;

  final Rx<Restaurant?> restaurantToEdit = Rx<Restaurant?>(null);

  // Controllers สำหรับฟอร์มข้อมูลทั่วไป
  final restaurantNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final openingHoursController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final locationController = TextEditingController();
  final typeController = TextEditingController();

  final RxBool isLoading = false.obs;

  // --- 1. ปรับปรุงตัวแปรสำหรับจัดการโปรโมชั่น ---
  final RxList<String> menuImages = <String>[].obs; // รูปเมนูยังเหมือนเดิม

  // ตัวแปรใหม่สำหรับจัดการโปรโมชั่น
  final Rx<BannerType> selectedBannerType = BannerType.image.obs; // ค่าเริ่มต้นเป็น รูปภาพ
  final RxList<String> bannerImagePaths = <String>[].obs; // เก็บ Path รูปโปรโมชั่น
  final RxList<TextEditingController> bannerTextControllers = <TextEditingController>[].obs; // เก็บ Controller ของแต่ละข้อความโปรโมชั่น


  EditRestaurantDetailsController({required this.restaurantId});

  @override
  void onInit() {
    super.onInit();
    _filterController = Get.find<FilterController>();
    _loadRestaurantData();
  }

  @override
  void onClose() {
    // ต้อง dispose controllers ทั้งหมดใน List ด้วย
    for (var controller in bannerTextControllers) {
      controller.dispose();
    }
    restaurantNameController.dispose();
    descriptionController.dispose();
    openingHoursController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
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
      typeController.text = foundRestaurant.type;
      menuImages.assignAll(foundRestaurant.menuImages);

      // --- 2. โหลดข้อมูลโปรโมชั่นตามประเภทที่บันทึกไว้ ---
      // ตรวจสอบว่าข้อมูล banner ที่มีอยู่เป็นรูปภาพหรือข้อความ
      // สมมติว่าถ้า promotion มี path ที่ลงท้ายด้วย .png, .jpg ฯลฯ แปลว่าเป็นรูป
      bool isBannerImage = foundRestaurant.promotion.isNotEmpty &&
                           (foundRestaurant.promotion.any((path) => path.contains('.jpg') || path.contains('.png')));

      if (isBannerImage) {
        selectedBannerType.value = BannerType.image;
        bannerImagePaths.assignAll(foundRestaurant.promotion);
      } else {
        selectedBannerType.value = BannerType.text;
        bannerTextControllers.assignAll(
          foundRestaurant.promotion.map((text) => TextEditingController(text: text)).toList()
        );
      }

    } else {
      Get.snackbar('ข้อผิดพลาด', 'ไม่พบข้อมูลร้านค้า');
      Get.back();
    }
  }

  // --- 3. ฟังก์ชันสำหรับเปลี่ยนประเภทโปรโมชั่น ---
  void setBannerType(BannerType type) {
    selectedBannerType.value = type;
  }

  // ฟังก์ชันสำหรับ "รูปเมนู" (เหมือนเดิม)
  Future<void> addMenuImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      menuImages.addAll(pickedFiles.map((x) => x.path));
    }
  }
  void removeMenuImage(int index) {
    if (index >= 0 && index < menuImages.length) {
      menuImages.removeAt(index);
    }
  }

  // --- 4. ฟังก์ชันสำหรับจัดการ "รูปโปรโมชั่น" ---
  Future<void> addPromotion() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      bannerImagePaths.addAll(pickedFiles.map((x) => x.path));
    }
  }
  void removeBannerImage(int index) {
    if (index >= 0 && index < bannerImagePaths.length) {
      bannerImagePaths.removeAt(index);
    }
  }

  // --- 5. ฟังก์ชันสำหรับจัดการ "ข้อความโปรโมชั่น" ---
  void addBannerField() {
    bannerTextControllers.add(TextEditingController());
  }
  void removeBannerField(int index) {
     if (index >= 0 && index < bannerTextControllers.length) {
      bannerTextControllers[index].dispose();
      bannerTextControllers.removeAt(index);
    }
  }

  Future<void> saveChanges() async {
    if (restaurantToEdit.value == null) return;
    isLoading.value = true;
    
    // --- 6. เตรียมข้อมูลโปรโมชั่นสำหรับบันทึกตามประเภทที่เลือก ---
    List<String> finalBannerData = [];
    if (selectedBannerType.value == BannerType.image) {
      finalBannerData = List<String>.from(bannerImagePaths);
    } else { // ถ้าเป็น BannerType.text
      finalBannerData = bannerTextControllers
          .map((controller) => controller.text)
          .where((text) => text.trim().isNotEmpty) //กรองเอาเฉพาะข้อความที่ไม่ว่าง
          .toList();
    }

    final updatedRestaurant = restaurantToEdit.value!.copyWith(
      restaurantName: restaurantNameController.text,
      description: descriptionController.text,
      openingHours: openingHoursController.text,
      phoneNumber: phoneNumberController.text,
      location: locationController.text,
      type: typeController.text,
      menuImages: List<String>.from(menuImages),
      promotion: finalBannerData, // บันทึกข้อมูลโปรโมชั่นชุดใหม่ลงไป
    );

    _filterController.updateRestaurantInList(updatedRestaurant);

    // ส่วนนี้สำคัญมากในการแก้ปัญหา "รูปไม่อัปเดตทันที"
    if (Get.isRegistered<RestaurantDetailController>(tag: restaurantId)) {
      final detailController = Get.find<RestaurantDetailController>(tag: restaurantId);
      detailController.restore(); //สั่งให้หน้า Detail โหลดข้อมูลใหม่
    }

    await Future.delayed(const Duration(milliseconds: 100));
    isLoading.value = false;

    Get.back();
    Get.snackbar('สำเร็จ', 'บันทึกข้อมูลร้านค้าเรียบร้อยแล้ว');
  }
}