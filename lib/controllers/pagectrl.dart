import 'package:food_near_me_app/controllers/slidectrl.dart';
import 'package:food_near_me_app/views/favorite_ui.dart';
import 'package:food_near_me_app/views/myshop_ui.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/controllers/scrollctrl.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';

class MainController extends GetxController {
  late PersistentTabController tabController;
  final LoginController _loginController = Get.find<LoginController>();
  int _previousIndex = 1;

  @override
  void onInit() {
    super.onInit();
    tabController = PersistentTabController(initialIndex: 1); // Start at the Home tab
    tabController.addListener(() {
      if ((tabController.index == 0 || tabController.index == 2) &&
          !_loginController.isLoggedIn.value) {
        // If not logged in and trying to access a protected tab,
        // show login dialog and jump back to the previous tab.
        _showLoginDialog();
        tabController.jumpToTab(_previousIndex);
      } else {
        // Update the previous index if the tab change is allowed.
        _previousIndex = tabController.index;
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // Function to show the dialog and navigate to LoginUi
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
                      Get.back(); // Close dialog
                      Get.offAll(() => LoginUi()); // Navigate to LoginUi and remove all previous routes
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color of the button
                      side: const BorderSide(color: Colors.green), // Border color
                    ),
                    child: const Text(
                      "ตกลง",
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Spacer between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(); // Close dialog
                      // The user will stay on the previous tab because of the listener logic.
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color of the button
                      side: const BorderSide(color: Colors.black), // Border color
                    ),
                    child: const Text(
                      "ยกเลิก",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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