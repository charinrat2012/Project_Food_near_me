import 'package:food_near_me_app/views/controllers/slidectrl.dart';
import 'package:food_near_me_app/views/favorite_ui.dart';
import 'package:food_near_me_app/views/myshop_ui.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/views/controllers/scrollctrl.dart'; 

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
        screen: MyshopUi(), 
        item: ItemConfig(
          icon: Icon(Icons.storefront), 
          title: "ร้านค้าของฉัน",
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