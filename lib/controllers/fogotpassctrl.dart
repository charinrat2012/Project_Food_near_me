import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/checkctrl.dart';
import 'package:food_near_me_app/views/otp_ui.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart'; // Import LoginController

class ForgotpassController extends GetxController {
  final emailController = TextEditingController();
  // String email = 'admin@gmail.com'; // ลบหรือคอมเมนต์ทิ้ง เพราะจะใช้ข้อมูลจาก LoginController แทน

  // Inject LoginController เพื่อเข้าถึงข้อมูลผู้ใช้
  final LoginController _loginController = Get.find<LoginController>();

  final CheckboxController checkboxController = Get.put(CheckboxController());

  // เพิ่มตัวแปร RxString เพื่อเก็บอีเมลที่ต้องการรีเซ็ตรหัสผ่าน
  final RxString _resetEmail = ''.obs;
  String get resetEmail => _resetEmail.value; // Getter สำหรับเข้าถึงอีเมลนี้

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void fetchfogotpass() {
    // ซ่อนคีย์บอร์ดหากยังเปิดอยู่
    FocusScope.of(Get.context!).unfocus();

    // 1. ตรวจสอบการกรอกข้อมูล
    if (emailController.text.isEmpty) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    // 2. ตรวจสอบรูปแบบอีเมล
    if (!emailController.text.isEmail) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกอีเมลให้ถูกต้อง',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    // 3. ตรวจสอบว่าอีเมลมีอยู่ในระบบหรือไม่ โดยใช้ข้อมูลจาก LoginController
    final String enteredEmail = emailController.text.trim();
    if (!_loginController.emails.contains(enteredEmail)) {
      // ใช้ enteredEmail ที่ trim แล้ว
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'ไม่พบอีเมลนี้ในระบบ',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    // 4. ตรวจสอบการยืนยันตัวตน (Checkbox)
    if (checkboxController.isChecked.value == false) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณายืนยันตัวตน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    // หากผ่านเงื่อนไขทั้งหมด: เก็บอีเมลลงใน _resetEmail ก่อนนำทาง
    _resetEmail.value = enteredEmail; // เก็บอีเมลที่ถูกต้องไว้

    // ล้างข้อมูลใน TextField และรีเซ็ต Checkbox
    emailController.clear();
    checkboxController.isChecked.value = false;

    // นำทางไปยังหน้า OTP
    Get.to(() => OtpUi()); // ใช้ Get.offAll() เพื่อล้าง stack ก่อนหน้า
    // Get.to(() => OtpUi()); // หรือใช้ Get.to() หากต้องการให้สามารถย้อนกลับจาก OTP ได้

    Get.snackbar(
      'System',
      'ส่ง OTP ไปยังอีเมลของคุณแล้ว', // แสดงข้อความแจ้งเตือนเมื่อสำเร็จ
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black.withValues(alpha: 0.1),
      colorText: Colors.black,
      duration: const Duration(milliseconds: 900),
    );
    return;
  }
}
