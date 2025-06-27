// lib/controllers/editeprofilectrl.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';

import '../views/myprofile_ui.dart'; // ยังคงมีการ import นี้อยู่

class EditProfileController extends GetxController {
  // เข้าถึง LoginController ที่ถูก inject ไว้แล้ว
  final LoginController _loginController = Get.find<LoginController>();

  // Controllers สำหรับ TextField เพื่อจัดการข้อมูลที่ผู้ใช้กรอก
  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // สถานะการโหลด เพื่อแสดง Loading Indicator บน UI
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // เมื่อ Controller ถูกสร้าง จะดึงข้อมูลปัจจุบันจาก LoginController มาใส่ใน TextField
    nicknameController.text = _loginController.userName.value;
    phoneController.text = _loginController.userPhoneNumber.value;
    emailController.text = _loginController.userEmail.value;
    // ไม่ควรดึงรหัสผ่านมาแสดงใน UI เพื่อความปลอดภัยและเพื่อบังคับให้ผู้ใช้กรอกใหม่หากต้องการเปลี่ยน
    // passwordController.text = _loginController.userPassword.value;
    // confirmPasswordController.text = _loginController.userPassword.value;
  }

  @override
  void onClose() {
    // ปิดการทำงานของ TextEditingController เพื่อป้องกัน memory leaks
    nicknameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void saveProfile() async { // เปลี่ยนเป็น async เพราะจะมีการหน่วงเวลาหรือเรียก API
    // ซ่อนคีย์บอร์ดหากยังเปิดอยู่
    FocusScope.of(Get.context!).unfocus();

    // 1. ตรวจสอบรหัสผ่านว่าตรงกันหรือไม่
    // ตรวจสอบเฉพาะเมื่อผู้ใช้กรอกรหัสผ่านใหม่เท่านั้น
    if (passwordController.text.isNotEmpty &&
        passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "รหัสผ่านไม่ตรงกัน",
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
      return; // หยุดการทำงานถ้ามีข้อผิดพลาด
    }

    // 2. ตรวจสอบรูปแบบอีเมล
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "รูปแบบอีเมลไม่ถูกต้อง",
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
      return; // หยุดการทำงานถ้ามีข้อผิดพลาด
    }

    // 3. ตรวจสอบว่ามีผู้ใช้ล็อกอินอยู่หรือไม่
    if (!_loginController.isLoggedIn.value || _loginController.userId.value.isEmpty) {
      Get.snackbar(
        "ข้อผิดพลาด",
        "ไม่สามารถบันทึกข้อมูลได้: ไม่ได้เข้าสู่ระบบ",
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
      return;
    }

    // ตั้งค่าสถานะการโหลดเป็น true เพื่อแสดง loading indicator
    isLoading.value = true;

    try {
      // ในแอปจริง: นี่คือส่วนที่คุณจะเรียก API เพื่อบันทึกข้อมูลที่ Backend
      await Future.delayed(const Duration(seconds: 1)); // จำลองการทำงาน asynchronous

      // ค้นหา index ของผู้ใช้ปัจจุบันใน mock data lists ของ LoginController
      final int userIndex = _loginController.emails.indexOf(_loginController.userEmail.value);

      if (userIndex != -1) {
        // อัปเดตข้อมูลใน List จำลอง (database)
        _loginController.names[userIndex] = nicknameController.text;
        _loginController.phoneNumber[userIndex] = phoneController.text;
        _loginController.emails[userIndex] = emailController.text;

        // อัปเดตรหัสผ่านใน List จำลอง เฉพาะเมื่อมีการกรอกรหัสผ่านใหม่เท่านั้น
        if (passwordController.text.isNotEmpty) {
          _loginController.passwords[userIndex] = passwordController.text;
        }

        // อัปเดตข้อมูลใน LoginController (reactive state)
        // เพื่อให้ UI ที่ฟังอยู่ (เช่น MyProfileUi) อัปเดตตัวเองโดยอัตโนมัติ
        _loginController.userName.value = nicknameController.text;
        _loginController.userPhoneNumber.value = phoneController.text;
        _loginController.userEmail.value = emailController.text;
        if (passwordController.text.isNotEmpty) {
          _loginController.userPassword.value = passwordController.text;
        }

      } else {
        // กรณีไม่พบผู้ใช้ใน List (ไม่ควรเกิดขึ้นหาก flow ถูกต้อง)
        Get.snackbar(
          "ข้อผิดพลาด",
          "ไม่พบบัญชีผู้ใช้สำหรับการอัปเดต",
          backgroundColor: Colors.red[100],
          colorText: Colors.black,
        );
        isLoading.value = false;
        return;
      }

      // กลับไปยังหน้าก่อนหน้า (MyProfileUi) ก่อนแสดง Snackbar เพื่อ UX ที่ดีขึ้น
      Get.back();

      // แสดง Snackbar เมื่อบันทึกสำเร็จ
      Get.snackbar(
        "สำเร็จ",
        "บันทึกข้อมูลเรียบร้อยแล้ว",
        snackPosition: SnackPosition.TOP, // สามารถปรับตำแหน่งได้ตามต้องการ
        backgroundColor: Colors.green[100],
        colorText: Colors.black,
      );

    } catch (e) {
      // จัดการข้อผิดพลาดที่เกิดขึ้นระหว่างการบันทึก (เช่น API error)
      Get.snackbar(
        "ข้อผิดพลาด",
        "ไม่สามารถบันทึกข้อมูลได้: ${e.toString()}", // แสดงข้อผิดพลาดที่ชัดเจนขึ้น
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
    } finally {
      // ไม่ว่าจะเกิดข้อผิดพลาดหรือไม่ก็ตาม ให้ปิดสถานะการโหลดเสมอ
      isLoading.value = false;
    }
  }
}