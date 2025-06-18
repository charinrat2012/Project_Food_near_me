import 'package:food_near_me_app/views/controllers/slidectrl.dart';
import 'package:food_near_me_app/views/favorite_ui.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/views/controllers/scrollctrl.dart'; 
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [
        AppBar(
          title: const Text('หน้าโปรไฟล์'),
          backgroundColor: Colors.orangeAccent,
          foregroundColor: Colors.white,
        ),
        const Expanded(
          child: Center(
            child: Text('ดูโปรไฟล์ของคุณที่นี่', style: TextStyle(fontSize: 24)),
          ),
        ),
      ],
    );
  }
}
class MainController extends GetxController {
  late PersistentTabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = PersistentTabController(initialIndex: 1);
  }
  @override
  void onClose() {
    tabController.dispose();
  }
  List<PersistentTabConfig> get tabs {
    return [
      PersistentTabConfig(
        screen: FavoriteUi(), 
        item: ItemConfig(
          icon: Icon(Icons.star),
          title: "รายการโปรด",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
      PersistentTabConfig(
        screen: HomeUi(), 
        item: ItemConfig(
          icon: Icon(Icons.person_2),
          title: "หน้าแรก",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
      PersistentTabConfig(
        screen: ProfileScreen(), 
        item: ItemConfig(
          icon: Icon(Icons.person), 
          title: "โปรไฟล์",
          activeForegroundColor: Colors.deepPurple,
          inactiveForegroundColor: Colors.white,
        ),
      ),
    ];
  }
  void goToHomeTab() {
    tabController.jumpToTab(1); 
    print('นำทางไปที่แท็บหน้าแรก (Index 1) ผ่าน FAB!');
  }
}