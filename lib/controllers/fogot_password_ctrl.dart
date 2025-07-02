import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/checkbox_ctrl.dart';
import 'package:food_near_me_app/views/otp_ui.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/login_ctrl.dart'; 

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  

  
  final LoginController _loginController = Get.find<LoginController>();

  final CheckboxController checkboxController = Get.put(CheckboxController());

  
  final RxString _resetEmail = ''.obs;
  String get resetEmail => _resetEmail.value; 

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void fetchfogotpass() {
    
    FocusScope.of(Get.context!).unfocus();

    
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

    
    final String enteredEmail = emailController.text.trim();
    if (!_loginController.emails.contains(enteredEmail)) {
      
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

    
    _resetEmail.value = enteredEmail; 

    
    emailController.clear();
    checkboxController.isChecked.value = false;

    
    Get.to(() => OtpUi()); 
    

    Get.snackbar(
      'System',
      'ส่ง OTP ไปยังอีเมลของคุณแล้ว', 
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black.withValues(alpha: 0.1),
      colorText: Colors.black,
      duration: const Duration(milliseconds: 900),
    );
    return;
  }
}
