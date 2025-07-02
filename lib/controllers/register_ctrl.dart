
import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/login_ctrl.dart';
import 'package:food_near_me_app/views/navbar_ui.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final LoginController _loginController = Get.find<LoginController>();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final _obscureText = true.obs;
  final _obscureText2 = true.obs;

  get obscureText => _obscureText.value;
  get obscureText2 => _obscureText2.value;

  set obscureText(value) => _obscureText.value = value;
  set obscureText2(value) => _obscureText2.value = value;

  final RxString _selectedProfileImagePath = ''.obs;
  String get selectedProfileImagePath => _selectedProfileImagePath.value;

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
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
      _selectedProfileImagePath.value = image.path;
    }
  }

  void fetchRegister() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        phoneNumberController.text.isEmpty) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    if (!emailController.text.isEmail) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกอีเมลให้ถูกต้อง',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    if (passwordController.text.length < 6) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'รหัสผ่านไม่ตรงกัน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    if (_loginController.emails.contains(emailController.text.trim())) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'อีเมลนี้ถูกใช้ไปแล้ว',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        colorText: Colors.black,
        duration: const Duration(milliseconds: 900),
      );
      return;
    }

    String newUserId = (_loginController.userid.length + 1).toString();
    String defaultProfileImage = 'assets/ics/person.png';

    _loginController.userid.add(newUserId);
    _loginController.names.add(usernameController.text.trim());
    _loginController.emails.add(emailController.text.trim());
    _loginController.passwords.add(passwordController.text.trim());
    _loginController.profileImages.add(
      _selectedProfileImagePath.value.isNotEmpty
          ? _selectedProfileImagePath.value
          : defaultProfileImage,
    );
    _loginController.phoneNumber.add(phoneNumberController.text.trim());
    _loginController.favoriteRestaurants.add('');

    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneNumberController.clear();
    _selectedProfileImagePath.value = '';
    FocusScope.of(Get.context!).unfocus();

    Get.closeCurrentSnackbar();
    Get.snackbar(
      'System',
      'ลงทะเบียนสำเร็จ! กรุณาเข้าสู่ระบบเพื่อดำเนินการต่อ',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black.withValues(alpha: 0.1),
      colorText: Colors.black,
      duration: const Duration(milliseconds: 900),
    );

    Get.offAll(() => LoginUi());
  }
}
