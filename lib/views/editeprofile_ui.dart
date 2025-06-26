// lib/views/editeprofile_ui.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/views/myprofile_ui.dart';

import '../controllers/editeprofilectrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/matwid/back_bt.dart';
import '../widgets/matwid/scrolltotop_bt.dart';

class EditProfileUi extends StatelessWidget {
  EditProfileUi({Key? key}) : super(key: key);
  // ไม่ต้องประกาศ TextEditingController ที่นี่แล้ว

  final ScrollpageController scrollpageController =
      Get.find<ScrollpageController>();

  @override
  Widget build(BuildContext context) {
    // *** ค้นหา EditProfileController ***
    final EditProfileController editController = Get.put(EditProfileController()); // Get.put() เพื่อสร้างและจัดการ lifecycle ของ controller
    final LoginController loginController = Get.find<LoginController>(); // เพื่อดึงรูปโปรไฟล์

    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double profileCircleSize = 100.0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Align(
            alignment: Alignment.centerLeft,
            child: BackBt(srcp: () => const MyprofileUi()),
          ),
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          actions: [
            Image.asset(
              "assets/imgs/logoHome.png",
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink[200]!, Colors.blue[200]!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                transform: GradientRotation(3.0),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink[200]!, Colors.blue[200]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  transform: GradientRotation(3.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink[200]!, Colors.blue[200]!],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        transform: GradientRotation(3.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          controller: scrollpageController.scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 60),
                              Obx(() => Text(
                                loginController.userName.value, // ดึงชื่อจาก LoginController
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              )),
                              const SizedBox(height: 10),
                              _buildTextFieldWithLabel(
                                'ชื่อเล่น',
                                editController.nicknameController, // ใช้ controller จาก EditProfileController
                                false,
                              ),
                              _buildTextFieldWithLabel(
                                'เบอร์โทรศัพท์',
                                editController.phoneController, // ใช้ controller จาก EditProfileController
                                false,
                              ),
                              _buildTextFieldWithLabel(
                                'อีเมล',
                                editController.emailController, // ใช้ controller จาก EditProfileController
                                false,
                              ),
                              _buildTextFieldWithLabel(
                                'รหัสผ่าน',
                                editController.passwordController, // ใช้ controller จาก EditProfileController
                                false,
                              ),
                              _buildTextFieldWithLabel(
                                'ยืนยันรหัสผ่าน',
                                editController.confirmPasswordController, // ใช้ controller จาก EditProfileController
                                false,
                              ),

                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                child: Obx(() => ElevatedButton( // ใช้ Obx เพื่อแสดง loading
                                  onPressed: editController.isLoading.value ? null : () => editController.saveProfile(), // ปิดปุ่มตอนกำลังโหลด
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink[400],
                                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: editController.isLoading.value
                                      ? const CircularProgressIndicator(color: Colors.white) // แสดง loading
                                      : const Text(
                                          'บันทึกข้อมูล',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                )),
                              ),
                              const SizedBox(height: 30), // เพิ่มระยะห่างด้านล่าง
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: statusBarHeight + appBarHeight - (profileCircleSize / 1.2),
              child: Align(
                alignment: Alignment.center,
                child: Obx(() => Container(
                  width: profileCircleSize,
                  height: profileCircleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      loginController.userProfileImageUrl.value, // ดึงจาก loginController
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
              ),
            ),
            Obx(
              () => scrollpageController.showScrollToTopButton.value
                  ? Positioned(
                      right: 20.0,
                      bottom: MediaQuery.of(context).padding.bottom + 16.0,
                      child: ScrollToTopButton(
                        onPressed: scrollpageController.scrollToTop,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method เพื่อสร้าง TextField พร้อม Label
  Widget _buildTextFieldWithLabel(
    String label,
    TextEditingController controller, // *** รับ TextEditingController โดยตรง ***
    bool isObscure,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller, // กำหนด controller ที่รับเข้ามา
            obscureText: isObscure,
            decoration: InputDecoration(
              hintText: 'กรอก $label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}