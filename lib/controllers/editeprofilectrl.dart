
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:image_picker/image_picker.dart';

import '../views/myprofile_ui.dart';

class EditProfileController extends GetxController {
  final LoginController _loginController = Get.find<LoginController>();

  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxBool isLoading = false.obs;

  final RxString _newProfileImagePath = ''.obs;
  String get newProfileImagePath => _newProfileImagePath.value;

  @override
  void onInit() {
    super.onInit();
    nicknameController.text = _loginController.userName.value;
    phoneController.text = _loginController.userPhoneNumber.value;
    emailController.text = _loginController.userEmail.value;
    _newProfileImagePath.value = _loginController.userProfileImageUrl.value;
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

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _newProfileImagePath.value = image.path;
    }
  }

  void saveProfile() async {
    FocusScope.of(Get.context!).unfocus();

    if (passwordController.text.isNotEmpty &&
        passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "รหัสผ่านไม่ตรงกัน",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "รูปแบบอีเมลไม่ถูกต้อง",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    if (!_loginController.isLoggedIn.value ||
        _loginController.userId.value.isEmpty) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "ไม่สามารถบันทึกข้อมูลได้: ไม่ได้เข้าสู่ระบบ",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 1));

      final int userIndex = _loginController.emails.indexOf(
        _loginController.userEmail.value,
      );

      if (userIndex != -1) {
        _loginController.names[userIndex] = nicknameController.text;
        _loginController.phoneNumber[userIndex] = phoneController.text;
        _loginController.emails[userIndex] = emailController.text;

        if (passwordController.text.isNotEmpty) {
          _loginController.passwords[userIndex] = passwordController.text;
        }
        if (_newProfileImagePath.value.isNotEmpty) {
          _loginController.profileImages[userIndex] =
              _newProfileImagePath.value;
          _loginController.userProfileImageUrl.value =
              _newProfileImagePath.value;
        }

        _loginController.userName.value = nicknameController.text;
        _loginController.userPhoneNumber.value = phoneController.text;
        _loginController.userEmail.value = emailController.text;
        if (passwordController.text.isNotEmpty) {
          _loginController.userPassword.value = passwordController.text;
        }
      } else {
        Get.snackbar(
          "ข้อผิดพลาด",
          "ไม่พบบัญชีผู้ใช้สำหรับการอัปเดต",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.black.withValues(alpha: 0.1),
          colorText: Colors.black,
          duration: const Duration(milliseconds: 900),
        );
        isLoading.value = false;
        return;
      }

      Get.back();

      Get.snackbar(
        "สำเร็จ",
        "บันทึกข้อมูลเรียบร้อยแล้ว",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
    } catch (e) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "ไม่สามารถบันทึกข้อมูลได้: ${e.toString()}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
