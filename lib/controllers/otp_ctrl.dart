import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/reset_password_ui.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final int fields; 
  
  String otp = '12345'; 

  
  final List<TextEditingController> otpcontroller;

  
  OtpController({this.fields = 5})
    : otpcontroller = List.generate(fields, (index) => TextEditingController());

  @override
  void onInit() {
    super.onInit();
    
    for (int i = 0; i < otpcontroller.length; i++) {
      otpcontroller[i].addListener(() {
        
        if (otpcontroller[i].text.length == 1 && i < otpcontroller.length - 1) {
          if (Get.context != null) {
            FocusScope.of(Get.context!).nextFocus();
          }
        }
        
        else if (otpcontroller[i].text.isEmpty && i > 0) {
          if (Get.context != null) {
            FocusScope.of(Get.context!).previousFocus();
          }
        }
      });
    }
  }

  @override
  void onClose() {
    
    for (var controller in otpcontroller) {
      controller.dispose();
    }
    super.onClose();
  }

  
  String getOtpValue() {
    return otpcontroller.map((controller) => controller.text).join();
  }

  
  void clearOtpFields() {
    for (var controller in otpcontroller) {
      controller.clear();
    }
  }

  
  void verifyOtp() async {
    
    String enteredOtp = getOtpValue();

    
    if (enteredOtp.isEmpty || enteredOtp.length < fields) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกรหัส OTP ให้ครบถ้วน', 
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return; 
    }

    
    if (enteredOtp != otp) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'รหัส OTP ไม่ถูกต้อง', 
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      
      return; 
    }

    
    
    
    await Future.delayed(
      const Duration(milliseconds: 1000),
    ); 

    
    clearOtpFields();
    if (Get.context != null) {
      FocusScope.of(Get.context!).unfocus();
    }

    
    Get.snackbar(
      'System',
      'ยืนยัน OTP สำเร็จ',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black.withValues(alpha: 0.1),
      colorText: Colors.black,
      duration: const Duration(milliseconds: 900),
    );

    
    Get.to(() => ResetPasswordUi());
  }
}
