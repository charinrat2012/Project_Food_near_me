import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/controllers/checkctrl.dart';
import 'package:food_near_me_app/views/otp_ui.dart';
import 'package:get/get.dart';

class ForgotpassController extends GetxController {
  final emailController = TextEditingController();
  String email = 'admin@gmail.com';
  final CheckboxController checkboxController = Get.put(CheckboxController());
  
  void fetchfogotpass() {
     if (emailController.text.isEmpty ) {
      Get.closeAllSnackbars();
       Get.snackbar(
          'System',
          'กรุณากรอกข้อมูลให้ครบถ้วน',
          // duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 255, 140, 131),
        
      );
      return;
    } else if (!emailController.text.isEmail) {
      Get.closeAllSnackbars();
       Get.snackbar(
          'System',
          'กรุณากรอกอีเมลให้ถูกต้อง',
          // duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 255, 140, 131),
        
      );
      return;
    }else if (emailController.text != email) {
      Get.closeAllSnackbars();
       Get.snackbar(
          'System',
          'ไม่พบอีเมลนี้ในระบบ',
          // duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 255, 140, 131),
        
      );
      return;
    }else if (checkboxController.isChecked.value == false) {
      Get.closeAllSnackbars();
       Get.snackbar(
          'System',
          'กรุณายืนยันตัวตน',
          // duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 255, 140, 131),
        
      );
      return;
    }
    // debugPrint('Email: ${emailController.text}');
    emailController.clear();
    
    FocusScope.of(Get.context!).unfocus(); 

    Navigator.of(Get.context!).push(
      MaterialPageRoute(
        builder: (context) => OtpUi(),
      ),

    );
    return;
  }
}