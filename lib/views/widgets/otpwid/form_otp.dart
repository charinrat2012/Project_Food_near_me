import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/controllers/otpctrl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormOtp extends StatelessWidget {
  FormOtp({super.key});

  // ใช้ Get.put() เพื่อเข้าถึง OtpCotroller ที่สร้างไว้
  final OtpCotroller controller = Get.put(OtpCotroller());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5, // สร้างช่อง OTP 5 ช่อง
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8*1, horizontal: 8*0.68),
            child: TextField(
              controller: controller.otpcontroller[index], // เชื่อมต่อกับ TextEditingController ของแต่ละช่องจาก OtpCotroller
              keyboardType: TextInputType.number, // แสดงแป้นพิมพ์ตัวเลข
              textAlign: TextAlign.center, // จัดตำแหน่งตัวเลขให้อยู่ตรงกลางช่อง
              maxLength: 1, // จำกัดการป้อนข้อมูลให้เหลือเพียง 1 ตัวอักษร
              
              // เพิ่ม onChanged กลับเข้ามาเพื่อจัดการการเลื่อน Focus
              onChanged: (value) {
                if (value.length == 1 && index < 4) {
                  // หากมีการพิมพ์ตัวเลข 1 หลัก และไม่ใช่ช่องสุดท้าย ให้เลื่อน Focus ไปยังช่องถัดไป
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  // หากช่องถูกลบจนว่างเปล่า และไม่ใช่ช่องแรก ให้เลื่อน Focus ไปยังช่องก่อนหน้า
                  FocusScope.of(context).previousFocus();
                }
              },
              decoration: InputDecoration(
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)), // ทำให้มุมของกรอบโค้งมน

                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 2.0), // เปลี่ยนสีเส้นขอบเป็นสีชมพูเมื่อโฟกัส
                  borderRadius: BorderRadius.all(Radius.circular(8.0)), // รักษามุมโค้งมนเมื่อโฟกัส
                ),
                counterText: "", // ซ่อนตัวนับจำนวนตัวอักษร
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0), // ปรับระยะห่างแนวตั้งภายในช่อง
                filled: true,
                fillColor: Colors.white.withValues(alpha: 8 * 0.03),
              ),
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold ,color: Colors.white), // กำหนดสไตล์ของข้อความที่ป้อน
            ),
          ),
        ),
      ),
      
    );
  }
}
