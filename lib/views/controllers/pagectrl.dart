import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// *** ตรวจสอบให้แน่ใจว่า import หน้าจอเหล่านี้ถูกต้อง ***
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';

// หาก ProfileScreen ยังไม่ได้อยู่ในไฟล์แยก ให้ย้ายมาอยู่ในไฟล์ของมันเอง
// หรือกำหนดเป็น class ด้านนอกของ MainScreenWithNavBar
// ตัวอย่าง: lib/views/profile_screen.dart
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าโปรไฟล์'),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('ดูโปรไฟล์ของคุณที่นี่', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}


class MainController extends GetxController {
  // ประกาศ PersistentTabController
  late PersistentTabController tabController;

  // List ของ PersistentTabConfig สำหรับแต่ละแท็บ
  // การสร้าง Instance ของ Screen ที่นี่จะถูกทำเมื่อ Controller ถูกสร้างขึ้น
  List<PersistentTabConfig> get tabs {
    return [
      PersistentTabConfig(
        screen:  LoginUi(), // แท็บแรก: หน้า "รายการโปรด" (Index 0)
        item: ItemConfig(
          icon:  Icon(Icons.star),
          title: "รายการโปรด",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
      PersistentTabConfig(
        screen:  HomeUi(), // แท็บที่สอง: หน้า "หน้าแรก" (HomeUi) - Index 1
        item: ItemConfig(
          icon:  Icon(Icons.person_2), // ไอคอนสำหรับแท็บ "หน้าแรก"
          title: "หน้าแรก",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
      PersistentTabConfig(
        screen:  ProfileScreen(), // แท็บที่สาม: หน้า "โปรไฟล์" - Index 2
        item: ItemConfig(
          icon:  Icon(Icons.person), // ไอคอนสำหรับแท็บ "โปรไฟล์"
          title: "โปรไฟล์",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize tabController เมื่อ Controller ถูกสร้างและพร้อมใช้งาน
    // กำหนด initialIndex เป็น 1 เพื่อให้หน้าแรกเริ่มต้นที่แท็บ "หน้าแรก"
    tabController = PersistentTabController(initialIndex: 1); 
    print('MainController onInit: PersistentTabController ถูกสร้างแล้ว');
  }

  @override
  void onClose() {
    // อย่าลืม dispose tabController เพื่อป้องกัน Memory Leak
    tabController.dispose();
    print('MainController onClose: PersistentTabController ถูก dispose แล้ว');
    super.onClose();
  }

  // เมธอดสำหรับนำทางไปยังแท็บ Home (หน้าแรก)
  void goToHomeTab() {
    tabController.jumpToTab(1); // "หน้าแรก" อยู่ที่ Index 1
    print('นำทางไปที่แท็บหน้าแรก (Index 1) ผ่าน FAB!');
  }
}

