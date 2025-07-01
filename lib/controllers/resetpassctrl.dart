import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart'; // Import LoginController
import 'package:food_near_me_app/controllers/fogotpassctrl.dart'; // Import ForgotpassController

class ResetpassController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _obscureText = true.obs;
  final _obscureText2 = true.obs;

  get obscureText => _obscureText.value;
  get obscureText2 => _obscureText2.value;

  set obscureText(value) => _obscureText.value = value;
  set obscureText2(value) => _obscureText2.value = value;

  // Inject LoginController เพื่อเข้าถึงและแก้ไขข้อมูลผู้ใช้
  final LoginController _loginController = Get.find<LoginController>();
  // Inject ForgotpassController เพื่อดึงอีเมลที่ต้องการรีเซ็ต
  final ForgotpassController _forgotpassController =
      Get.find<ForgotpassController>();

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void fetchReset() {
    // ซ่อนคีย์บอร์ดหากยังเปิดอยู่
    FocusScope.of(Get.context!).unfocus();

    // 1. ตรวจสอบการกรอกข้อมูล
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }
    // 2. ตรวจสอบความยาวรหัสผ่าน
    else if (passwordController.text.length < 6) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',

        'กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }
    // 3. ตรวจสอบว่ารหัสผ่านตรงกันหรือไม่
    else if (passwordController.text != confirmPasswordController.text) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'รหัสผ่านไม่ตรงกัน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    // ดึงอีเมลที่ต้องการรีเซ็ตมาจาก ForgotpassController
    final String targetEmail = _forgotpassController.resetEmail;

    // ตรวจสอบว่ามีอีเมลถูกส่งมาหรือไม่
    if (targetEmail.isEmpty) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'เกิดข้อผิดพลาด: ไม่พบอีเมลสำหรับรีเซ็ตรหัสผ่าน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      Get.offAll(() => LoginUi()); // นำกลับไปหน้า Login
      return;
    }

    // ค้นหา index ของผู้ใช้ด้วยอีเมลที่ได้จาก ForgotpassController
    final int userIndex = _loginController.emails.indexOf(targetEmail);

    if (userIndex == -1) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'เกิดข้อผิดพลาด: ไม่พบข้อมูลผู้ใช้สำหรับอีเมลนี้',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      Get.offAll(() => LoginUi()); // นำกลับไปหน้า Login
      return;
    }

    // 4. ตรวจสอบรหัสผ่านซ้ำกับรหัสผ่านเก่า
    final String currentOldPassword =
        _loginController.passwords[userIndex]; // รหัสผ่านเก่าของ user คนนี้
    if (passwordController.text == currentOldPassword) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'รหัสผ่านนี้เคยใช้ไปแล้ว กรุณาใช้รหัสผ่านใหม่ที่ไม่ซ้ำกับรหัสเดิม',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    // หากผ่านเงื่อนไขทั้งหมด: อัปเดตรหัสผ่านใหม่ใน LoginController's mock data
    _loginController.passwords[userIndex] = passwordController.text;

    // สำคัญ: ถ้าผู้ใช้ที่รีเซ็ตรหัสผ่านเป็นคนเดียวกับที่เคยล็อกอินอยู่ก่อนหน้านี้
    // และ userPassword ใน LoginController ยังคงเป็นค่าเก่า
    // เราควรจะอัปเดต userPassword ใน _loginController ด้วย เพื่อให้ข้อมูลที่แสดงใน MyProfileUi ถูกต้อง
    // แต่ควรทำเฉพาะเมื่อ userEmail.value ตรงกับ targetEmail เท่านั้น
    if (_loginController.userEmail.value == targetEmail) {
      _loginController.userPassword.value = passwordController.text;
    }

    // ล้างข้อมูลใน TextField และซ่อนคีย์บอร์ด
    passwordController.clear();
    confirmPasswordController.clear();
    FocusScope.of(Get.context!).unfocus();

    Get.snackbar(
      'System',
      'รีเซ็ตรหัสผ่านสำเร็จ!',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white.withValues(alpha: 0.1),
      colorText: Colors.black,
      duration: const Duration(milliseconds: 900),
    );

    // นำทางไปยังหน้า LoginUi
    Get.offAll(() => LoginUi());
  }
}
