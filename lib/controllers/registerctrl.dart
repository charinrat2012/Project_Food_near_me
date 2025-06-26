import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:get/get.dart';
class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _obscureText = true.obs;
  final _obscureText2 = true.obs;
  get obscureText => _obscureText.value;
  get obscureText2 => _obscureText2.value;
  set obscureText(value) => _obscureText.value = value;
  set obscureText2(value) => _obscureText2.value = value;
  void fetchRegister() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty || usernameController.text.isEmpty || confirmPasswordController.text.isEmpty ) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
          'System',
          'กรูณากรอกข้อมูลให้ครบถ้วน',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade200,
      );
      return;
    } else if (!emailController.text.isEmail) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
          'System',
          'กรูณากรอกอีเมลให้ถูกต้อง',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade200,
      );
      return;
    }  else if (passwordController.text.length < 6) {
     Get.closeCurrentSnackbar();
     Get.snackbar(
          'System',
          'กรูณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade200,
      );
      return;
    } else if (passwordController.text != confirmPasswordController.text) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
          'System',
          'รหัสผ่านไม่ตรงกัน',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade200,
      );
      return;
    }
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    FocusScope.of(Get.context!).unfocus(); 
    Get.offAll(LoginUi());
    return;
  }
}
