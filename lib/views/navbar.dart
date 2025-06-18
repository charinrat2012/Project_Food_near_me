import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// Import หน้า HomeUi ของคุณ

import 'controllers/pagectrl.dart'; // ตัวอย่างหน้าจออื่นๆ ในแท็บ

class Navbar extends StatelessWidget {
  const Navbar({super.key});

   @override
  Widget build(BuildContext context) {
    // สร้าง (หรือค้นหา) Instance ของ MainController
    // Get.put() จะสร้าง Controller ครั้งแรก และคืนค่า Instance เดิมในการเรียกครั้งถัดไป
    // final MainController controller = Get.put(MainController());
final MainController controller = Get.find<MainController>();
    return PersistentTabView(
      controller: controller.tabController, // ใช้ tabController จาก Controller
      tabs: controller.tabs, // ใช้ getter tabs จาก Controller
      navBarBuilder: (navBarConfig) => Style6BottomNavBar( // ใช้ Style6 เพื่อให้มีปุ่มตรงกลาง
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Colors.pink[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToHomeTab, // เรียกใช้เมธอดจาก Controller
        backgroundColor: const Color.fromARGB(255, 204, 187, 255),
        shape: const CircleBorder(),
        elevation: 0,
        child: const Icon(Icons.home, color: Colors.white, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      stateManagement: true, // กำหนดให้คงสถานะของแต่ละแท็บ
      // hideNavigationBarWhenKeyboardShows: true, // ตัวอย่างการตั้งค่าเพิ่มเติม
    );
  }
}