// Project_Food_near_me - Copy/lib/views/register_ui.dart
import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/registerctrl.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/widgets/matwid/back3_bt.dart';
import 'package:food_near_me_app/widgets/matwid/back_bt.dart';
import 'package:food_near_me_app/widgets/matwid/backgoundlogin.dart';
import 'package:food_near_me_app/widgets/matwid/blurcontainer.dart';
import 'package:food_near_me_app/widgets/regiswid/register_bt.dart';
import 'package:food_near_me_app/widgets/regiswid/register_head.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/widgets/regiswid/form_register.dart';
import '../widgets/matwid/iconperson.dart';
import 'navbar.dart';
import 'dart:io'; // import เพิ่มเติมสำหรับ File

class RegisterUi extends StatelessWidget {
  RegisterUi({super.key});

  final RegisterController controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Positioned.fill(child: Backgoundlogin()),

          Scaffold(
            backgroundColor: Colors.transparent,

            body: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 8 * 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Blurcontainer(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.65,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Stack(children: [Back3Bt(),  Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () => controller.pickProfileImage(),
                              child: Obx(() => CircleAvatar(
                                radius: 44,
                                backgroundColor: Colors.white.withValues(alpha: 8 * 0.1),
                                backgroundImage: controller.selectedProfileImagePath.isNotEmpty && File(controller.selectedProfileImagePath).existsSync() // ตรวจสอบว่ามีรูปใหม่ที่เลือกและไฟล์มีอยู่จริง
                                    ? FileImage(File(controller.selectedProfileImagePath)) as ImageProvider // แสดงรูปที่เลือก
                                    : const AssetImage(''), // รูปภาพเริ่มต้น
                                child: controller.selectedProfileImagePath.isEmpty
                                    ? Icon(Icons.camera_alt, size: 50, color: Colors.grey[600])
                                    : null,
                              )),
                            ),
                          ), ]),
                          // เพิ่มส่วนเลือกรูปโปรไฟล์ที่นี่
                         
                          Expanded(child: SizedBox()),
                          RegisterHead(),
                          Expanded(child: SizedBox()),
                          FormRegister(),
                          Expanded(child: SizedBox()),

                          RegisterBt(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}