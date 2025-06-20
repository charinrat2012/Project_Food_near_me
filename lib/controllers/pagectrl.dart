import 'package:food_near_me_app/controllers/slidectrl.dart';
import 'package:food_near_me_app/views/favorite_ui.dart';
import 'package:food_near_me_app/views/myshop_ui.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/controllers/scrollctrl.dart'; 

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
          icon: Icon(Icons.star, color: Colors.amber),
          title: "รายการโปรด",
          
          activeForegroundColor: Colors.white,
          inactiveForegroundColor: Colors.white,
        ),
      ),
      PersistentTabConfig(
        screen: HomeUi(), 
        item: ItemConfig(
          icon: Icon(Icons.home, color: Colors.teal.shade200),
          title: "หน้าแรก",
          activeForegroundColor: Colors.white,
          inactiveForegroundColor: Colors.white,
        ),
      ),
      PersistentTabConfig(
        screen: MyshopUi(), 
        item: ItemConfig(
          icon: Icon(Icons.backup_table, color: Colors.limeAccent), 
          title: "ร้านค้าของฉัน",
          activeForegroundColor: Colors.white,
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