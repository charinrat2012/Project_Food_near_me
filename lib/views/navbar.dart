import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../controllers/pagectrl.dart';
// ไม่จำเป็นต้อง import scrollctrl.dart ในไฟล์นี้อีกต่อไป

class Navbar extends StatefulWidget {
  const Navbar({super.key});
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late MainController _mainController;
  // ไม่จำเป็นต้องมี ScrollpageController ที่นี่

  @override
  void initState() {
    super.initState();
    _mainController = Get.find<MainController>();
    // ไม่มีการเพิ่ม Listener ที่เกี่ยวกับ ScrollController ที่นี่
  }

  // ไม่จำเป็นต้องมีเมธอด dispose() และ _onTabChanged() ที่เกี่ยวกับ scrollController

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _mainController.tabController,
      tabs: _mainController.tabs,
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        height: 60,
        navBarDecoration: NavBarDecoration(
          color: Colors.pink[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          gradient: LinearGradient(colors: [
            Colors.pink[200]!,
            Colors.blue[300]!,
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      // เราจะใช้ stateManagement เป็น true เพื่อรักษา state ของแต่ละหน้าไว้
      // ซึ่งตอนนี้ปลอดภัยแล้วเพราะแต่ละหน้ามี Controller ของตัวเอง
      stateManagement: true,
    );
  }
}
