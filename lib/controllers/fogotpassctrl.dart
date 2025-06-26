import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/checkctrl.dart';
import 'package:food_near_me_app/views/otp_ui.dart';
import 'package:get/get.dart';
class ForgotpassController extends GetxController {
  final emailController = TextEditingController();
  String email = 'admin@gmail.com';
  final CheckboxController checkboxController = Get.put(CheckboxController());
  void fetchfogotpass() {
     if (emailController.text.isEmpty ) {
      Get.closeCurrentSnackbar();
       Get.snackbar(
          'System',
          'กรุณากรอกข้อมูลให้ครบถ้วน',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade200,
      );
      return;
    } else if (!emailController.text.isEmail) {
      Get.closeCurrentSnackbar();
       Get.snackbar(
          'System',
          'กรุณากรอกอีเมลให้ถูกต้อง',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade200,
      );
      return;
    }else if (emailController.text != email) {
      Get.closeCurrentSnackbar();
       Get.snackbar(
          'System',
          'ไม่พบอีเมลนี้ในระบบ',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade200,
      );
      return;
    }else if (checkboxController.isChecked.value == false) {
      Get.closeCurrentSnackbar();
       Get.snackbar(
          'System',
          'กรุณายืนยันตัวตน',
          colorText: Colors.white,
          backgroundColor: Colors.red.shade200,
      );
      return;
    }
    emailController.clear();
    FocusScope.of(Get.context!).unfocus(); 
    checkboxController.isChecked.value = false;
    Get.offAll(() => OtpUi());
    return;
  }
}