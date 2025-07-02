import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart'; 
import 'package:food_near_me_app/controllers/fogotpassctrl.dart'; 

class ResetpassController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _obscureText = true.obs;
  final _obscureText2 = true.obs;

  get obscureText => _obscureText.value;
  get obscureText2 => _obscureText2.value;

  set obscureText(value) => _obscureText.value = value;
  set obscureText2(value) => _obscureText2.value = value;

  
  final LoginController _loginController = Get.find<LoginController>();
  
  final ForgotpassController _forgotpassController =
      Get.find<ForgotpassController>();

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void fetchReset() {
    
    FocusScope.of(Get.context!).unfocus();

    
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

    
    final String targetEmail = _forgotpassController.resetEmail;

    
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
      Get.offAll(() => LoginUi()); 
      return;
    }

    
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
      Get.offAll(() => LoginUi()); 
      return;
    }

    
    final String currentOldPassword =
        _loginController.passwords[userIndex]; 
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

    
    _loginController.passwords[userIndex] = passwordController.text;

    
    
    
    
    if (_loginController.userEmail.value == targetEmail) {
      _loginController.userPassword.value = passwordController.text;
    }

    
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

    
    Get.offAll(() => LoginUi());
  }
}
