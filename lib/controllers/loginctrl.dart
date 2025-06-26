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

List<String> userid = ['1', '2', '3'];
List<String> names = ['Admin', 'User','User2'];
List<String> emails = ['admin@gmail.com', 'user@gmail.com', 'user2@gmail.com'];
List<String> passwords = ['123456', '654321', '654321'];
List<String> profileImages = ['assets/imgs/pofile.jpg', 'assets/ics/person.png', 'assets/ics/person.png'];
List<String> phoneNumber = ['0123456789', '9876543210', '9876543210'];
List<String> favoriteRestaurants = ['1,2', '2,3', '3,6'];


  final RxBool isLoggedIn = false.obs;
  final RxString userId = ''.obs;
  final RxString userName = ''.obs;
  final RxString userEmail = ''.obs;
  final RxString userPhoneNumber = ''.obs;
  final RxString userPassword = ''.obs;
  final RxString userProfileImageUrl = ''.obs;
 final RxList<String> userFavoriteList = <String>[].obs;

  void fetchLogin() {
    final String inputEmail = emailController.text.trim(); // .trim() เพื่อลบช่องว่างหน้าหลัง
    final String inputPassword = passwordController.text.trim();
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade200,
      );
_clearUserData();
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
_clearUserData();
      return;
    }
    final int userIndex = emails.indexOf(inputEmail);


    if (userIndex != -1 && passwords[userIndex] == inputPassword) {
      // เข้าสู่ระบบสำเร็จ
      isLoggedIn.value = true;
      userId.value = userid[userIndex];
      userName.value = names[userIndex];
      userEmail.value = emails[userIndex];
      userProfileImageUrl.value = profileImages[userIndex];
      userPhoneNumber.value = phoneNumber[userIndex];
      userPassword.value = passwords[userIndex];


      if (userIndex < favoriteRestaurants.length) {
        userFavoriteList.value = favoriteRestaurants[userIndex]
            .split(',')
            .map((e) => e.trim()) // trim ช่องว่างที่อาจมี
            .toList();
      } else {
        userFavoriteList.clear(); // หากไม่มีข้อมูล favorite ให้เคลียร์
      }

      emailController.clear();
      passwordController.clear();
      FocusScope.of(Get.context!).unfocus(); // ซ่อนคีย์บอร์ด



      Get.closeCurrentSnackbar(); // ปิด snackbar เก่า (ถ้ามี)
      Get.snackbar(
        'System',
        'เข้าสู่ระบบสำเร็จ! ยินดีต้อนรับ ${userName.value}',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.green.shade400,
      );

      Get.offAll(() => Navbar()); // นำทางไปยัง Navbar (หรือหน้าหลัก)
    } else {
      // อีเมลหรือรหัสผ่านไม่ถูกต้อง
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'รหัสผ่านหรืออีเมลของคุณไม่ถูกต้อง',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade200,
      );
      _clearUserData();
    }
  }


  Future<void> logout() async {
   _clearUserData();

    // รอให้ Popup ปิดสนิทก่อน
    await Future.delayed(const Duration(milliseconds: 200));

    Get.snackbar(
      'System',
      'คุณได้ออกจากระบบเรียบร้อยแล้ว',
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
    );

    await Future.delayed(const Duration(milliseconds: 200));
    Get.offAll(() => LoginUi());
  }
   void _clearUserData() {
    isLoggedIn.value = false;
    userId.value = '';
    userName.value = '';
    userEmail.value = '';
    userProfileImageUrl.value = '';
    userPhoneNumber.value = '';
    userPassword.value = '';
  }
}
