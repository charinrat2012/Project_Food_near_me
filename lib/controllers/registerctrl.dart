import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart'; // Import LoginController
import 'package:food_near_me_app/views/navbar.dart'; // Import Navbar (ยังคงต้อง import ไว้หากมีการใช้งาน Navbar ใน Controller อื่นๆ)

class RegisterController extends GetxController {
  // Inject LoginController to manage user data
  final LoginController _loginController = Get.find<LoginController>();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController(); // Add phone number controller

  final _obscureText = true.obs;
  final _obscureText2 = true.obs;

  get obscureText => _obscureText.value;
  get obscureText2 => _obscureText2.value;

  set obscureText(value) => _obscureText.value = value;
  set obscureText2(value) => _obscureText2.value = value;

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose(); // Dispose phone number controller
    super.onClose();
  }

  void fetchRegister() {
    // 1. Validate all required fields
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        phoneNumberController.text.isEmpty) { // Include phone number in validation
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade200,
      );
      return;
    }

    // 2. Validate email format
    if (!emailController.text.isEmail) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกอีเมลให้ถูกต้อง',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade200,
      );
      return;
    }

    // 3. Validate password length
    if (passwordController.text.length < 6) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade200,
      );
      return;
    }

    // 4. Validate password confirmation
    if (passwordController.text != confirmPasswordController.text) {
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

    // 5. Check if email already exists (mock check)
    if (_loginController.emails.contains(emailController.text.trim())) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'อีเมลนี้ถูกใช้ไปแล้ว',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.orange.shade200,
      );
      return;
    }

    // --- All validations passed, proceed with registration (mock) ---
    // In a real app, you would send this data to a backend for user creation.

    // Generate a new unique ID for the user (mock)
    String newUserId = (_loginController.userid.length + 1).toString();
    String defaultProfileImage = 'assets/ics/person.png'; // Default profile image for new users
    // String defaultPhoneNumber = 'ระบุเบอร์โทร'; // Default phone number for new users

    // Add new user data to LoginController's mock lists
    _loginController.userid.add(newUserId);
    _loginController.names.add(usernameController.text.trim());
    _loginController.emails.add(emailController.text.trim());
    _loginController.passwords.add(passwordController.text.trim()); // In real app: hash password
    _loginController.profileImages.add(defaultProfileImage);
    _loginController.phoneNumber.add(phoneNumberController.text.trim());
    _loginController.favoriteRestaurants.add(''); // New user starts with no favorites

    // *** ส่วนที่เปลี่ยนแปลง: ไม่ล็อกอินผู้ใช้โดยตรงหลังจากลงทะเบียน ***
    // เราจะไม่ update current logged-in user here
    // _loginController.isLoggedIn.value = true;
    // _loginController.userId.value = newUserId;
    // _loginController.userName.value = usernameController.text.trim();
    // _loginController.userEmail.value = emailController.text.trim();
    // _loginController.userPhoneNumber.value = phoneNumberController.text.trim();
    // _loginController.userPassword.value = passwordController.text.trim();
    // _loginController.userProfileImageUrl.value = defaultProfileImage;
    // _loginController.userFavoriteList.clear();

    // Clear text fields and unfocus keyboard
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneNumberController.clear();
    FocusScope.of(Get.context!).unfocus();

    // Show success snackbar
    Get.closeCurrentSnackbar();
    Get.snackbar(
      'System',
      'ลงทะเบียนสำเร็จ! กรุณาเข้าสู่ระบบเพื่อดำเนินการต่อ', // เปลี่ยนข้อความแจ้งเตือน
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade400,
      duration: const Duration(seconds: 2),
    );

    // *** ส่วนที่เปลี่ยนแปลง: นำทางไปยังหน้า LoginUi ***
    Get.offAll(() => LoginUi());
  }
}