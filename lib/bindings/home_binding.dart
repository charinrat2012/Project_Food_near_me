// lib/bindings/home_binding.dart
import 'package:get/get.dart';
import 'package:food_near_me_app/views/controllers/scrollctrl.dart';

import '../views/controllers/slidectrl.dart'; // ตรวจสอบ path


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // ใช้ Get.lazyPut เพื่อให้ Controller ถูกสร้างเมื่อถูกเรียกใช้ครั้งแรกใน View
    Get.lazyPut<ScrollpageController>(() => ScrollpageController());
    Get.lazyPut<SlideController>(() => SlideController());
  }
}