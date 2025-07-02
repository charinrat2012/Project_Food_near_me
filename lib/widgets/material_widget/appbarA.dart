
import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/setting_ui.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io'; 

import '../../controllers/login_ctrl.dart';
import '../../views/login_ui.dart';
import '../../views/my_profile_ui.dart';
import '../../controllers/filte_rctrl.dart';

class AppbarA extends StatelessWidget implements PreferredSizeWidget {
  final String tag;

  const AppbarA({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    final FilterController filterController = Get.find<FilterController>();

    return AppBar(
      backgroundColor: Colors.pink[200],
      title: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          "assets/imgs/logoHome.png",
          height: 8 * 10,
          fit: BoxFit.contain,
        ),
      ),
      toolbarHeight: 8 * 12,
      automaticallyImplyLeading: false,
      actions: [
        Obx(() {
          if (loginController.isLoggedIn.value) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: PopupMenuButton<String>(
                onSelected: (String result) async {
                  filterController.clearSearchFocus( tag);
                  FocusScope.of(context).unfocus();

                  await Future.delayed(const Duration(milliseconds: 100));

                  if (result == 'profile') {
                    Get.to(() => MyprofileUi());
                  } else if (result == 'setting') {
                    Get.to(() => SettingUi());
                  } else if (result == 'logout') {
                    loginController.logout();
                    Get.offAll(() => LoginUi());
                  }
                },
                color: Colors.pink[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                offset: const Offset(0, 50),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'profile',
                    child: Text('ดูหน้าโปรไฟล์'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'setting',
                    child: Text('การตั้งค่า'),
                  ),
                  PopupMenuItem<String>(
                    value: 'logout',
                    child: Text(
                      'ออกจากระบบ',
                      style: GoogleFonts.carlito(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: loginController.userProfileImageUrl.value.isNotEmpty
                      ? (loginController.userProfileImageUrl.value.startsWith('assets/') 
                          ? AssetImage(loginController.userProfileImageUrl.value) 
                          : File(loginController.userProfileImageUrl.value).existsSync() 
                              ? FileImage(File(loginController.userProfileImageUrl.value)) 
                              : const AssetImage('assets/ics/person.png') 
                        ) as ImageProvider<Object>? 
                      : null,
                  child: loginController.userProfileImageUrl.value.isEmpty
                      ? const Icon(Icons.person, color: Colors.white)
                      : null,
                  backgroundColor: loginController.userProfileImageUrl.value.isEmpty
                      ? Colors.grey
                      : null,
                ),
              ),
            );
          } else {
            return TextButton(
              onPressed: () {
                filterController.clearSearchFocus(tag);
                FocusScope.of(context).unfocus();
                Get.offAll(() => LoginUi());
              },
              child: const Text(
                "ล็อคอิน",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        }),
        const SizedBox(width: 10),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink[200]!,
              Colors.blue[200]!,
            ],
            begin: Alignment.centerLeft,
            transform: GradientRotation(3.0),
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(8 * 12);
}