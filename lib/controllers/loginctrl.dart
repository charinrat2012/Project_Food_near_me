import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:get/get.dart';
import '../views/login_ui.dart';
import '../views/navbar_ui.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _obscureText = true.obs;
  

  get obscureText => _obscureText.value;
  set obscureText(value) => _obscureText.value = value;

  List<String> userid = ['1', '2', '3'];
  List<String> names = ['Admin', 'User', 'User2'];
  List<String> emails = [
    'admin@gmail.com',
    'user@gmail.com',
    'user2@gmail.com',
  ];
  List<String> passwords = ['123456', '654321', '654321'];
  List<String> profileImages = [
    'assets/imgs/pofile.jpg',
    'assets/ics/person.png',
    'assets/ics/person.png',
  ];
  List<String> phoneNumber = ['0123456789', '9876543210', '9876543210'];
  List<String> favoriteRestaurants = ['1,2', '2,3', '3,6'];

  final RxBool isLoggedIn = true.obs;
  final RxString userId = '1'.obs;
  final RxString userName = ''.obs;
  final RxString userEmail = ''.obs;
  final RxString userPhoneNumber = ''.obs;
  final RxString userPassword = ''.obs;
  final RxString userProfileImageUrl = ''.obs;
  final RxList<String> userFavoriteList = <String>[].obs;

  void fetchLogin() {
    final String inputEmail = emailController.text.trim();
    final String inputPassword = passwordController.text.trim();
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      _clearUserData();
      return;
    } else if (!emailController.text.isEmail) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกอีเมลให้ถูกต้อง',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      _clearUserData();
      return;
    }
    final int userIndex = emails.indexOf(inputEmail);

    if (userIndex != -1 && passwords[userIndex] == inputPassword) {
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
            .map((e) => e.trim())
            .toList();
      } else {
        userFavoriteList.clear();
      }

      emailController.clear();
      passwordController.clear();
      FocusScope.of(Get.context!).unfocus();

      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'เข้าสู่ระบบสำเร็จ! ยินดีต้อนรับ ${userName.value}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );

      
      Get.to(() => Navbar());
    } else {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'รหัสผ่านหรืออีเมลของคุณไม่ถูกต้อง',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      _clearUserData();
    }
  }

  Future<void> logout() async {
    _clearUserData();

    await Future.delayed(const Duration(milliseconds: 100));

    Get.snackbar(
      'System',
      'คุณได้ออกจากระบบเรียบร้อยแล้ว',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black.withValues(alpha: 0.1),
      colorText: Colors.black,
      duration: const Duration(milliseconds: 900),
    );

    await Future.delayed(const Duration(milliseconds: 100));
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
    userFavoriteList
        .clear(); 
  }

  Future<void> deleteAccount() async {
    
    
    
    
    

    try {
      
      if (!isLoggedIn.value || userId.value.isEmpty) {
        Get.snackbar(
          'ข้อผิดพลาด',
          'ไม่สามารถลบบัญชีได้: ไม่ได้เข้าสู่ระบบ',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.black.withValues(alpha: 0.1),
          colorText: Colors.black,
          duration: const Duration(milliseconds: 900),
        );
        
        
        return;
      }

      
      final int userIndex = userid.indexOf(userId.value);

      if (userIndex == -1) {
        Get.snackbar(
          'ข้อผิดพลาด',
          'ไม่พบบัญชีผู้ใช้สำหรับการลบ',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.black.withValues(alpha: 0.1),
          colorText: Colors.black,
          duration: const Duration(milliseconds: 900),
        );
        
        
        return;
      }

      
      
      

      
      await Future.delayed(const Duration(seconds: 1));

      
      userid.removeAt(userIndex);
      names.removeAt(userIndex);
      emails.removeAt(userIndex);
      passwords.removeAt(userIndex);
      profileImages.removeAt(userIndex);
      phoneNumber.removeAt(userIndex);
      
      if (userIndex < favoriteRestaurants.length) {
        favoriteRestaurants.removeAt(userIndex);
      }

      
      _clearUserData();

      
      

      Get.snackbar(
        'ลบบัญชีสำเร็จ',
        'บัญชีของคุณถูกลบเรียบร้อยแล้ว',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );

      
      Get.offAll(() => LoginUi());
    } catch (e) {
      
      
      

      Get.snackbar(
        'ลบบัญชีไม่สำเร็จ',
        'เกิดข้อผิดพลาดในการลบบัญชี: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
    }
  }

  
  var isPasswordVisible = false.obs;

  
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  var isEditPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  void toggleEditPasswordVisibility() {
    isEditPasswordVisible.value = !isEditPasswordVisible.value;
  }

  
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
}
