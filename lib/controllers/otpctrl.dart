import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/resetpass.dart';
import 'package:get/get.dart';

class OtpCotroller extends GetxController {
  final int fields; // จำนวนช่อง OTP
  // OTP จำลอง (ในแอปจริง OTP จะถูกสร้างและส่งจาก Backend)
  String otp = '12345'; // สมมติ OTP คือ 12345

  // List ของ TextEditingController สำหรับแต่ละช่อง OTP
  final List<TextEditingController> otpcontroller;

  // Constructor สำหรับ OtpController
  OtpCotroller({this.fields = 5})
      : otpcontroller = List.generate(fields, (index) => TextEditingController());

  @override
  void onInit() {
    super.onInit();
    // เพิ่ม Listener ให้กับแต่ละช่อง OTP เพื่อจัดการ Focus
    for (int i = 0; i < otpcontroller.length; i++) {
      otpcontroller[i].addListener(() {
        // หากกรอกตัวอักษร 1 ตัวและไม่ใช่ช่องสุดท้าย ให้เลื่อนไปช่องถัดไป
        if (otpcontroller[i].text.length == 1 && i < otpcontroller.length - 1) {
          if (Get.context != null) {
            FocusScope.of(Get.context!).nextFocus();
          }
        }
        // หากลบตัวอักษรจนว่างและไม่ใช่ช่องแรก ให้เลื่อนไปช่องก่อนหน้า
        else if (otpcontroller[i].text.isEmpty && i > 0) {
          if (Get.context != null) {
            FocusScope.of(Get.context!).previousFocus();
          }
        }
      });
    }
  }

  @override
  void onClose() {
    // ปิดการทำงานของ TextEditingController ทั้งหมดเพื่อป้องกัน memory leaks
    for (var controller in otpcontroller) {
      controller.dispose();
    }
    super.onClose();
  }

  // เมธอดสำหรับรวมค่า OTP จากทุกช่อง
  String getOtpValue() {
    return otpcontroller.map((controller) => controller.text).join();
  }

  // เมธอดสำหรับล้างข้อมูลในช่อง OTP ทั้งหมด
  void clearOtpFields() {
    for (var controller in otpcontroller) {
      controller.clear();
    }
  }

  // เมธอดสำหรับยืนยัน OTP
  void verifyOtp() async { // เปลี่ยนเป็น async เพื่อใช้ Future.delayed
    String enteredOtp = getOtpValue();

    // 1. ตรวจสอบว่ากรอก OTP ครบถ้วนหรือไม่
    if (enteredOtp.isEmpty || enteredOtp.length < fields) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'กรุณากรอกรหัส OTP ให้ครบถ้วน', // ข้อความที่ชัดเจนขึ้น
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade200,
      );
      return; // หยุดการทำงาน
    }

    // 2. ตรวจสอบ OTP ว่าถูกต้องหรือไม่
    if (enteredOtp != otp) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        'System',
        'รหัส OTP ไม่ถูกต้อง', // ข้อความที่ชัดเจนขึ้น
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade200,
      );
      // clearOtpFields(); // ล้างช่อง OTP เมื่อ OTP ไม่ถูกต้อง (ไม่บังคับ แต่ช่วย UX)
      return; // หยุดการทำงาน
    }

    // หาก OTP ถูกต้อง
    // ในแอปจริง: อาจจะเรียก API เพื่อยืนยัน OTP กับ Backend
    // จำลองการทำงาน: หน่วงเวลาเล็กน้อยเพื่อจำลองการตรวจสอบ
    await Future.delayed(const Duration(milliseconds: 1000)); // จำลองการทำงาน 1 วินาที

    // ล้างข้อมูลในช่อง OTP และซ่อนคีย์บอร์ด
    clearOtpFields();
    if (Get.context != null) {
      FocusScope.of(Get.context!).unfocus();
    }

    // แสดง Snackbar แจ้งเตือนสำเร็จ
    Get.snackbar(
      'System',
      'ยืนยัน OTP สำเร็จ',
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade400,
      duration: const Duration(seconds: 2),
    );

    // นำทางไปยังหน้า ResetpassUi
    Get.to(() => ResetpassUi());
  }
}