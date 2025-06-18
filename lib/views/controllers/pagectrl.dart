import 'package:food_near_me_app/views/controllers/slidectrl.dart';
import 'package:food_near_me_app/views/favorite_ui.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// *** ตรวจสอบให้แน่ใจว่า import หน้าจอเหล่านี้ถูกต้อง ***
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';

// Import controllers ที่เกี่ยวข้อง
import 'package:food_near_me_app/views/controllers/scrollctrl.dart'; // ตรวจสอบ path


// lib/views/controllers/pagectrl.dart (หรือย้าย ProfileScreen ไปไฟล์อื่น ถ้าต้องการ)
// ไม่จำเป็นต้อง import PersistentTabController หรือ Get ใน ProfileScreen แล้ว ถ้า ProfileScreen แค่แสดง UI

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ลบ Scaffold ออกไป
    return Column( // หรือ Container, Stack, CustomScrollView, หรือ Widget อื่นๆ ที่เหมาะสมกับเนื้อหา
      children: [
        // ถ้าคุณต้องการ AppBar สำหรับแท็บนี้ คุณสามารถใส่ AppBar เข้าไปตรงๆ ใน Column/Stack ได้เลย
        AppBar(
          title: const Text('หน้าโปรไฟล์'),
          backgroundColor: Colors.orangeAccent,
          foregroundColor: Colors.white,
        ),
        const Expanded( // ใช้ Expanded เพื่อให้เนื้อหาที่เหลือเติมเต็มพื้นที่
          child: Center(
            child: Text('ดูโปรไฟล์ของคุณที่นี่', style: TextStyle(fontSize: 24)),
          ),
        ),
      ],
    );
  }
}

class MainController extends GetxController {
  // ประกาศ PersistentTabController
  late PersistentTabController tabController;

  @override
  void onInit() {
    super.onInit();
    // Initialize tabController เมื่อ Controller ถูกสร้างและพร้อมใช้งาน
    // กำหนด initialIndex เป็น 1 เพื่อให้หน้าแรกเริ่มต้นที่แท็บ "หน้าแรก"
    tabController = PersistentTabController(initialIndex: 1);
    // print('MainController onInit: PersistentTabController ถูกสร้างแล้ว');

    // // *** Get.put() ScrollpageController และ SlideController ที่นี่ เพียงครั้งเดียว ***
    // // ให้ controllers เหล่านี้มีชีวิตอยู่ตราบเท่าที่ MainController มีชีวิตอยู่
    // Get.put<ScrollpageController>(ScrollpageController());
    // Get.put<SlideController>(SlideController());
    // print('ScrollpageController และ SlideController ถูก put แล้ว');
  }

  @override

  void onClose() {
    // อย่าลืม dispose tabController เพื่อป้องกัน Memory Leak
    tabController.dispose();
    // // Get.delete() Controllers ที่ถูก put โดย MainController เมื่อ MainController ถูกปิด
    // Get.delete<ScrollpageController>();
    // Get.delete<SlideController>();
    // print('MainController onClose: Controllers ถูก dispose และ delete แล้ว');
    // super.onClose();
  }

  // List ของ PersistentTabConfig สำหรับแต่ละแท็บ
  // การสร้าง Instance ของ Screen ที่นี่จะถูกทำเมื่อ Controller ถูกสร้างขึ้น
  List<PersistentTabConfig> get tabs {
    return [
      PersistentTabConfig(
        screen: FavoriteUi(), // แท็บแรก: หน้า "รายการโปรด" (Index 0)
        item: ItemConfig(
          icon: Icon(Icons.star),
          title: "รายการโปรด",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
      PersistentTabConfig(
        screen: HomeUi(), // แท็บที่สอง: หน้า "หน้าแรก" (HomeUi) - Index 1
        item: ItemConfig(
          icon: Icon(Icons.person_2), // ไอคอนสำหรับแท็บ "หน้าแรก"
          title: "หน้าแรก",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
      PersistentTabConfig(
        screen: ProfileScreen(), // แท็บที่สาม: หน้า "โปรไฟล์" - Index 2
        item: ItemConfig(
          icon: Icon(Icons.person), // ไอคอนสำหรับแท็บ "โปรไฟล์"
          title: "โปรไฟล์",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
    ];
  }

  // เมธอดสำหรับนำทางไปยังแท็บ Home (หน้าแรก)
  void goToHomeTab() {
    tabController.jumpToTab(1); // "หน้าแรก" อยู่ที่ Index 1
    print('นำทางไปที่แท็บหน้าแรก (Index 1) ผ่าน FAB!');
  }
}