import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/setting_ui.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/loginctrl.dart';
import '../../views/login_ui.dart';
import '../../views/myprofile_ui.dart';

class AppbarA extends StatelessWidget implements PreferredSizeWidget {
  const AppbarA({super.key});

  @override
  Widget build(BuildContext context) {
     final LoginController loginController = Get.find<LoginController>();
    return AppBar(
          
       
            backgroundColor: Colors.pink[200],
            title: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/imgs/logoHome.png",
                height: 8 *10,
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
                          onSelected: (String result) {
                            if (result == 'profile') {
                              Get.offAll(() => MyprofileUi()); // นำทางไปหน้าโปรไฟล์
                            } else if (result == 'setting') {
                              Get.offAll(() => SettingUi()); // ออกจากระบบ
                            }else if (result == 'logout') {
                              loginController.logout(); // ออกจากระบบ
                            }
                          },
                            color: Colors.pink[50],
                             shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0), // ทำให้มีมุมโค้งมน
                          ),
                          offset: const Offset(0, 50),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                             PopupMenuItem<String>(
                              value: 'profile',
                              child: Text('ดูหน้าโปรไฟล์'),
                            ),
                            PopupMenuItem<String>(
                              value: 'setting',
                              child: Text('การตั้งค่า'),
                            ),
                            PopupMenuItem<String>(
                              value: 'logout',
                              child: Text('ออกจากระบบ', style: GoogleFonts.carlito(color: Colors.red,fontWeight: FontWeight.bold)),
                            ),
                          ],
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: loginController.userProfileImageUrl.value.isNotEmpty
                                ? AssetImage(loginController.userProfileImageUrl.value)
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
             
          flexibleSpace: Container( // ใช้ flexibleSpace เพื่อใส่ Gradient
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink[200]!, // สีชมพูอ่อน
                    Colors.blue[200]!, // สีชมพูอ่อน
                    
                  ],
                  begin: Alignment.centerLeft,
                  transform: GradientRotation( 3.0),
                  end: Alignment.centerRight,
                ),
              ),
            ),
          );

    
  }
   @override
  Size get preferredSize => const Size.fromHeight(8 * 12);
}