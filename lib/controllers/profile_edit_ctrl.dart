
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/login_ctrl.dart';
import 'package:image_picker/image_picker.dart';

import '../views/my_profile_ui.dart';

class EditProfileController extends GetxController {
  final LoginController _loginController = Get.find<LoginController>();

  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();

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
    locationController.text = _loginController.userlocations.value;
  }

  @override
  void onClose() {
    nicknameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.onClose();
  }

 Future<void> pickProfileImage() async {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Wrap( // ใช้ Wrap เพื่อให้ content พอดีกับความสูง
          children: <Widget>[
            const ListTile(
              title: Text(
                'เลือกรูปโปรไฟล์',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(thickness: 1),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.pink),
              title: const Text('ถ่ายรูปจากกล้อง'),
              onTap: () {
                _pickImage(ImageSource.camera);
                Get.back(); // ปิด BottomSheet
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.blue),
              title: const Text('เลือกจากคลังรูปภาพ'),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Get.back(); // ปิด BottomSheet
              },
            ),
            const SizedBox(height: 10), // เพิ่มระยะห่างด้านล่างเล็กน้อย
          ],
        ),
      ),
      backgroundColor: Colors.transparent, // ทำให้พื้นหลังของ BottomSheet โปร่งใส
      elevation: 0,
    );
  }

  // ฟังก์ชันนี้ไม่ต้องแก้ไข
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      _newProfileImagePath.value = image.path;
    }
  }


  void saveProfile() async {
    FocusScope.of(Get.context!).unfocus();

    if (phoneController.text.length != 10) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "หมายเลขโทรศัพท์ไม่ถูกต้อง",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }
    if (nicknameController.text.isEmpty) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "กรุณากรอกชื่อ",
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
        _loginController.locations[userIndex] = locationController.text;

       
        if (_newProfileImagePath.value.isNotEmpty) {
          _loginController.profileImages[userIndex] =
              _newProfileImagePath.value;
          _loginController.userProfileImageUrl.value =
              _newProfileImagePath.value;
        }

        _loginController.userName.value = nicknameController.text;
        _loginController.userPhoneNumber.value = phoneController.text;
        _loginController.userEmail.value = emailController.text;
        _loginController.userlocations.value = locationController.text;
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
