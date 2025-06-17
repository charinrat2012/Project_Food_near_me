// lib/controllers/home_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollpageController extends GetxController {
  // สร้าง ScrollController เป็น Property ของ Controller
  late ScrollController scrollController;

  // สร้างสถานะการแสดงปุ่มแบบ Reactive ด้วย RxBool
  // .obs ทำให้ตัวแปรนี้เป็น Observable (สังเกตได้)
  final RxBool showScrollToTopButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    // เพิ่ม Listener ให้กับ scrollController
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    // อย่าลืม dispose scrollController เมื่อ Controller ถูกปิด
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  // Listener สำหรับ ScrollController
  void _scrollListener() {
    // ตรวจสอบตำแหน่งการเลื่อน
    // ถ้าเลื่อนลงมาเกิน 200 pixel และ showScrollToTopButton เป็น false
    if (scrollController.offset >= 200 && !showScrollToTopButton.value) {
      showScrollToTopButton.value = true; // อัปเดตค่าโดยตรง (GetX จะ rebuild Obx อัตโนมัติ)
    }
    // ถ้าเลื่อนกลับไปด้านบน (น้อยกว่า 200 pixel) และ showScrollToTopButton เป็น true
    else if (scrollController.offset < 200 && showScrollToTopButton.value) {
      showScrollToTopButton.value = false; // อัปเดตค่าโดยตรง
    }
  }

  // ฟังก์ชันสำหรับเลื่อนไปด้านบนสุด
  void scrollToTop() {
    scrollController.animateTo(
      0.0, // ตำแหน่งบนสุด
      duration: const Duration(milliseconds: 500), // ระยะเวลาแอนิเมชัน
      curve: Curves.easeInOut, // รูปแบบการเคลื่อนไหว
    );
  }
}