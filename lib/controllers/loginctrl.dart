import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:get/get.dart';
import '../views/login_ui.dart';
import '../views/navbar.dart';
class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _obscureText = true.obs;
  get obscureText => _obscureText.value;
  set obscureText(value) => _obscureText.value = value;
  String email = 'admin@gmail.com';
  String password = '123456';
  final RxBool isLoggedIn = false.obs;
  final RxString userProfileImageUrl = ''.obs;
  void fetchLogin() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.closeAllSnackbars();
      Get.snackbar(
        'System',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: const Color.fromARGB(255, 255, 140, 131),
      );
        isLoggedIn.value = false;
      userProfileImageUrl.value = '';
      return;
    } else if (!emailController.text.isEmail) {
      Get.closeAllSnackbars();
      Get.snackbar(
        'System',
        'กรุณากรอกอีเมลให้ถูกต้อง',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: const Color.fromARGB(255, 255, 140, 131),
      );
        isLoggedIn.value = false;
      userProfileImageUrl.value = '';
      return;
    } else if (emailController.text != email ||
        passwordController.text != password) {
      Get.closeAllSnackbars();
      Get.snackbar(
        'System',
        'รหัสผ่านหรืออีเมลของคุณไม่ถูกต้อง ',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: const Color.fromARGB(255, 255, 140, 131),
      );
        isLoggedIn.value = false;
      userProfileImageUrl.value = '';
      return;
    }
    isLoggedIn.value = true;
    userProfileImageUrl.value = 'assets/imgs/pofile.jpg';
    emailController.clear();
    passwordController.clear();
    FocusScope.of(Get.context!).unfocus();
              Get.offAll(() => Navbar());
    return;
  }
   void logout() {
    isLoggedIn.value = false;
    userProfileImageUrl.value = ''; // ล้างรูปโปรไฟล์เมื่อออกจากระบบ
    Get.snackbar(
      'System',
      'คุณได้ออกจากระบบเรียบร้อยแล้ว',
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
    );
    Get.offAll(() => LoginUi()); // นำทางกลับไปหน้า LoginUi
  }
}

