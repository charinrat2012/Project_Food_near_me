import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:get/get.dart';
import '../views/login_ui.dart';
import '../views/navbar.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _obscureText = true.obs;
  // เพิ่ม observable เพื่อควบคุม obscureText



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
    final String inputEmail = emailController.text.trim();
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
        colorText: Colors.white,
        backgroundColor: Colors.green.shade400,
        duration: const Duration(seconds: 2),
      );

      // Get.offAll(() => Navbar());
      Get.to(() => Navbar());
    } else {
     
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

   
    await Future.delayed(const Duration(milliseconds: 100));

    Get.snackbar(
      'System',
      'คุณได้ออกจากระบบเรียบร้อยแล้ว',
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
    );

    await Future.delayed(const Duration(milliseconds: 100));
    Get.offAll(() => LoginUi());
    // Get.to(() => LoginUi());
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

     Future<void> deleteAccount() async {
    // ในแอปพลิเคชันจริง: อาจแสดง loading dialog ก่อนเรียก API
    // Get.dialog(
    //   const Center(child: CircularProgressIndicator()),
    //   barrierDismissible: false,
    // );

    try {
      // ตรวจสอบว่าผู้ใช้ล็อกอินอยู่หรือไม่และมี userId ที่ถูกต้องหรือไม่
      if (!isLoggedIn.value || userId.value.isEmpty) {
        Get.snackbar(
          'ข้อผิดพลาด',
          'ไม่สามารถลบบัญชีได้: ไม่ได้เข้าสู่ระบบ',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // ปิด loading dialog หากมี
        // Get.back();
        return;
      }

      // ค้นหา index ของผู้ใช้ปัจจุบันใน mock data lists
      final int userIndex = userid.indexOf(userId.value);

      if (userIndex == -1) {
        Get.snackbar(
          'ข้อผิดพลาด',
          'ไม่พบบัญชีผู้ใช้สำหรับการลบ',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // ปิด loading dialog หากมี
        // Get.back();
        return;
      }

      // *** ในแอปพลิเคชันจริง: เรียก API หรือ Firebase Auth เพื่อลบบัญชีผู้ใช้จริง ***
      // ตัวอย่าง Firebase Auth: await FirebaseAuth.instance.currentUser!.delete();
      // หรือเรียก API: await apiService.deleteUser(userId.value);
      
      // จำลองการทำงาน: หน่วงเวลา 2 วินาทีเพื่อจำลองการเรียก API
      await Future.delayed(const Duration(seconds: 1));

      // ลบข้อมูลผู้ใช้จากทุก List จำลอง (นี่คือการ "ลบ" จริงๆ ในบริบทของ Mock Data)
      userid.removeAt(userIndex);
      names.removeAt(userIndex);
      emails.removeAt(userIndex);
      passwords.removeAt(userIndex);
      profileImages.removeAt(userIndex);
      phoneNumber.removeAt(userIndex);
      // ตรวจสอบ favoriteRestaurants.length ก่อน removeAt เพื่อป้องกัน Index out of bounds
      if (userIndex < favoriteRestaurants.length) {
        favoriteRestaurants.removeAt(userIndex);
      }
      
      // หลังจากลบบัญชีใน Backend/Mock Data สำเร็จ ให้ล้างข้อมูลผู้ใช้ใน Controller
      _clearUserData();

      // ปิด loading dialog หากมี
      // Get.back();

      Get.snackbar(
        'ลบบัญชีสำเร็จ',
        'บัญชีของคุณถูกลบเรียบร้อยแล้ว',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // นำทางไปยังหน้า Login หลังจากลบบัญชีสำเร็จ
      Get.offAll(() => LoginUi());

    } catch (e) {
      // หากเกิดข้อผิดพลาดในการลบ
      // ปิด loading dialog หากมี
      // Get.back();

      Get.snackbar(
        'ลบบัญชีไม่สำเร็จ',
        'เกิดข้อผิดพลาดในการลบบัญชี: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Error deleting account: $e'); // แสดงข้อผิดพลาดใน console สำหรับ debug
    }
  }

  // เมธอดส่วนตัวสำหรับล้างข้อมูลผู้ใช้

}
