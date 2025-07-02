import 'package:food_near_me_app/controllers/slidectrl.dart';
import 'package:food_near_me_app/views/favourite_ui.dart';
import 'package:food_near_me_app/views/my_shop_ui.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/controllers/scrollctrl.dart';
import 'package:food_near_me_app/controllers/login_ctrl.dart';

class PageNavbarController extends GetxController {
  late PersistentTabController tabController;
  final LoginController _loginController = Get.find<LoginController>();
  int _previousIndex = 1;

  @override
  void onInit() {
    super.onInit();
    tabController = PersistentTabController(initialIndex: 1);
    tabController.addListener(() {
      if ((tabController.index == 0 || tabController.index == 2) &&
          !_loginController.isLoggedIn.value) {
        _showLoginDialog();
        tabController.jumpToTab(_previousIndex);
      } else {
        _previousIndex = tabController.index;
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void _showLoginDialog() {
    Get.defaultDialog(
      title: 'แจ้งเตือน',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("ไปยังหน้าเข้าสู่ระบบ ?"),
          const SizedBox(height: 8 * 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.offAll(() => LoginUi());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.green),
                    ),
                    child: const Text(
                      "ตกลง",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black),
                    ),
                    child: const Text(
                      "ยกเลิก",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
    );
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
  }
}
