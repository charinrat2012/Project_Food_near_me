import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/filterctrl.dart';
import 'package:food_near_me_app/controllers/detailctrl.dart';
import '../model/restaurant.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker

class EditRestaurantDetailsController extends GetxController {
  final String restaurantId;
  late final FilterController _filterController;

  final Rx<Restaurant?> restaurantToEdit = Rx<Restaurant?>(null);

  final restaurantNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final openingHoursController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final locationController = TextEditingController();
  final menuImageController = TextEditingController(); // Keep for data binding
  final bannerImageController =
      TextEditingController(); // Keep for data binding
  final typeController = TextEditingController();

  final RxBool isLoading = false.obs;

  // New reactive variables for displaying selected images
  final RxString selectedMenuImagePath = ''.obs;
  final RxString selectedBannerImagePath = ''.obs;

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

      // Initialize reactive paths for display
      selectedMenuImagePath.value = foundRestaurant.menuImage;
      selectedBannerImagePath.value = foundRestaurant.bannerImage;
    } else {
      Get.snackbar(
        'ข้อผิดพลาด',
        'ไม่พบข้อมูลร้านค้าสำหรับการแก้ไข',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withOpacity(0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      Get.back();
    }
  }

  // New method to pick images
  Future<void> pickImage(
    ImageSource source, {
    required bool isMenuImage,
  }) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      if (isMenuImage) {
        selectedMenuImagePath.value = pickedFile.path;
        menuImageController.text =
            pickedFile.path; // Update text controller as well
      } else {
        selectedBannerImagePath.value = pickedFile.path;
        bannerImageController.text =
            pickedFile.path; // Update text controller as well
      }
    }
  }

  Future<void> saveChanges() async {
    if (restaurantToEdit.value == null) {
      Get.snackbar(
        'ข้อผิดพลาด',
        'ไม่สามารถบันทึก: ไม่พบข้อมูลร้านค้า',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withOpacity(0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    if (restaurantNameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        openingHoursController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        locationController.text.isEmpty ||
        typeController.text.isEmpty) {
      Get.snackbar(
        'ข้อผิดพลาด',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withOpacity(0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
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
      menuImage: menuImageController.text, // Use updated path
      bannerImage: bannerImageController.text, // Use updated path
      type: typeController.text,
    );

    _filterController.updateRestaurantInList(updatedRestaurant);

    if (Get.isRegistered<RestaurantDetailController>(tag: restaurantId)) {
      final detailController = Get.find<RestaurantDetailController>(
        tag: restaurantId,
      );
      detailController.restore();
    }

    await Future.delayed(const Duration(milliseconds: 100));
    isLoading.value = false;

    Get.back();

    Get.snackbar(
      'สำเร็จ',
      'บันทึกข้อมูลร้านค้าเรียบร้อยแล้ว',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black.withOpacity(0.1),
      colorText: Colors.black,
      duration: const Duration(milliseconds: 900),
    );
  }
}
