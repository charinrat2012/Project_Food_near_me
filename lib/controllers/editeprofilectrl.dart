// lib/controllers/editprofilectrl.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';

import '../views/myprofile_ui.dart';

class EditProfileController extends GetxController {
  final LoginController _loginController = Get.find<LoginController>();

  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

 
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
   
    nicknameController.text = _loginController.userName.value;
    phoneController.text = _loginController.userPhoneNumber.value;
    emailController.text = _loginController.userEmail.value;
    passwordController.text = _loginController.userPassword.value;
    confirmPasswordController.text = _loginController.userPassword.value;
  }

  @override
  void onClose() {
   
    nicknameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void saveProfile() {
   
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "รหัสผ่านไม่ตรงกัน",
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
      return;
    }

   
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "รูปแบบอีเมลไม่ถูกต้อง",
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
      return;
    }

    isLoading.value = true;
   
    Future.delayed(const Duration(seconds: 1), () {
     
      _loginController.userName.value = nicknameController.text;
      _loginController.userPhoneNumber.value = phoneController.text;
      _loginController.userEmail.value = emailController.text;
      _loginController.userPassword.value = passwordController.text;


      isLoading.value = false;
      Get.snackbar(
        "สำเร็จ",
        "บันทึกข้อมูลเรียบร้อยแล้ว",
        backgroundColor: Colors.green[100],
        colorText: Colors.black,
      );
      // Get.offAll(() => MyprofileUi());
      Get.back();
    });
  }
}