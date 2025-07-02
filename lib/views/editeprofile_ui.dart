import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/views/myprofile_ui.dart';
import 'dart:io'; 

import '../controllers/editeprofilectrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/matwid/back3_bt.dart';
import '../widgets/matwid/back_bt.dart';
import '../widgets/matwid/scrolltotop_bt.dart';


class EditProfileUi extends StatelessWidget {
  EditProfileUi({Key? key}) : super(key: key);

  final LoginController loginController = Get.find<LoginController>();
  final EditProfileController editController = Get.put(EditProfileController());

  final ScrollpageController scrollpageController =
        Get.put(ScrollpageController(), tag: 'edit_profile_scroll');

  @override
  Widget build(BuildContext context) {
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
            child: Back3Bt(),
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
                               Text(
                                'แก้ไขข้อมูลส่วนตัว',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const SizedBox(height: 10),
                              _buildTextFieldWithLabel(
                                'ชื่อเล่น',
                                editController.nicknameController,
                                false,
                              ),
                              _buildTextFieldWithLabel(
                                'เบอร์โทรศัพท์',
                                editController.phoneController,
                                false,
                              ),
                              _buildTextFieldWithLabel(
                                'อีเมล',
                                editController.emailController,
                                false,
                              ),
                              _buildPasswordTextFieldWithToggle(
                                'รหัสผ่าน',
                                editController.passwordController,
                                loginController.isEditPasswordVisible,
                                loginController.toggleEditPasswordVisibility,
                              ),
                              _buildPasswordTextFieldWithToggle(
                                'ยืนยันรหัสผ่าน',
                                editController.confirmPasswordController,
                                loginController.isConfirmPasswordVisible,
                                loginController.toggleConfirmPasswordVisibility,
                              ),

                              const SizedBox(height: 5),
                              SizedBox(
                                width: double.infinity,
                                child: Obx(() => ElevatedButton(
                                  onPressed: editController.isLoading.value ? null : () => editController.saveProfile(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink[400],
                                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: editController.isLoading.value
                                      ? const CircularProgressIndicator(color: Colors.white)
                                      : const Text(
                                          'บันทึกข้อมูล',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                )),
                              ),
                              const SizedBox(height: 30),
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
                child: InkWell(
                  onTap: () => editController.pickProfileImage(),
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
                      child: editController.newProfileImagePath.isNotEmpty && File(editController.newProfileImagePath).existsSync() 
                          ? Image.file(
                              File(editController.newProfileImagePath), 
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              loginController.userProfileImageUrl.value,
                              fit: BoxFit.cover,
                            ),
                    ),
                  )),
                ),
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

  Widget _buildTextFieldWithLabel(
      String label, TextEditingController controller, bool isObscure) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
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
          const SizedBox(height: 3),
          TextField(
            controller: controller,
            obscureText: isObscure,
            decoration: InputDecoration(
              hintText: 'กรอก $label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 12.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextFieldWithToggle(
    String label,
    TextEditingController controller,
    RxBool isVisible,
    VoidCallback toggleFunction,
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
          Obx(
            () => TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'กรอก $label',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisible.value ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: toggleFunction,
                ),
              ),
              obscureText: !isVisible.value,
            ),
          ),
        ],
      ),
    );
  }
}