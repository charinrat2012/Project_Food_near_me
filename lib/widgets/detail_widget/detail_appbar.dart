import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/restaurant_detail_ctrl.dart';
import '../../controllers/restaurant_edit_detail_ctrl.dart';
import '../../controllers/login_ctrl.dart';
import '../../controllers/scrollctrl.dart';
import '../../views/edit_restaurant_detail_ui.dart';
import '../material_widget/back3_bt.dart';

class DetailAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String restaurantId;
  const DetailAppbar({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailController controller =
        Get.find<RestaurantDetailController>(tag: restaurantId);
         final restaurant = controller.restaurant.value!;
    final LoginController loginController = Get.find<LoginController>();
    return AppBar(
          backgroundColor: Colors.pink[200],
          title: Align(alignment: Alignment.centerLeft, child: Back3Bt()),
          toolbarHeight: 8 * 10,
          automaticallyImplyLeading: false,
          actions: [
            Obx(() {
              if (controller.restaurant.value == null) {
                return const SizedBox.shrink();
              }
              final appBarActions = <Widget>[];
              if (loginController.isLoggedIn.value &&
                  restaurant.ownerId == loginController.userId.value) {
                appBarActions.add(
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(
                            () => EditRestaurantDetailsUi(
                              restaurantId: restaurant.id,
                            ),
                            binding: BindingsBuilder(() {
                              Get.lazyPut(
                                () => EditRestaurantDetailsController(
                                  restaurantId: restaurant.id,
                                ),
                                tag: restaurant.id,
                              );
                              Get.lazyPut(
                                () => ScrollpageController(),
                                tag: 'edit_details_scroll_${restaurant.id}',
                              );
                            }),
                          );
                        },
                        child: Text(
                          "แก้ไขร้าน",
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.deleteRestaurant();
                        },
                        child: Text(
                          "ลบร้าน",
                          style: GoogleFonts.kanit(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                appBarActions.add(
                  Image.asset(
                    "assets/imgs/logoHome.png",
                    height: 8 * 10,
                    fit: BoxFit.contain,
                  ),
                );
              }

              return Row(children: appBarActions);
            }),
            const SizedBox(width: 10),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink[200]!, Colors.blue[200]!],
                begin: Alignment.centerLeft,
                transform: GradientRotation(3.0),
                end: Alignment.centerRight,
              ),
            ),
          ),
        );
  }
    @override
  Size get preferredSize => const Size.fromHeight(8 * 12);
}