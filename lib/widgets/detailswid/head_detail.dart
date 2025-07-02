import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/detailctrl.dart';
import '../../controllers/filterctrl.dart';
import '../../controllers/loginctrl.dart';
import '../matwid/dotline.dart';

class HeadDetail extends StatelessWidget {
  final String restaurantId;
  const HeadDetail({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailController controller = Get.find<RestaurantDetailController>(tag: restaurantId);
    final LoginController loginController = Get.find<LoginController>();
    final FilterController filterController = Get.find<FilterController>();
    // final FilterController filterController = Get.find<FilterController>();
    final restaurant = controller.restaurant.value!;
    return Column(
      children: [
        Dotline(
          gradientColors: LinearGradient(
            colors: [Colors.blue.shade50, Colors.pink.shade200],
          ),
          height: 4,
          dashWidth: 6,
        ),
        Container(
          height: 8 * 7,
          color: Colors.pink.shade50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  restaurant.restaurantName,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Obx(() {
                    if (controller.restaurant.value == null) {
                      return const SizedBox.shrink();
                    }
                    final restaurant = controller.restaurant.value!;
                    return IconButton(
                      icon: Icon(
                        restaurant.isFavorite.value
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_outline_rounded,
                        color: restaurant.isFavorite.value
                            ? Colors.amber
                            : Colors.black,
                      ),
                      onPressed: loginController.isLoggedIn.value
                          ? () {
                               bool wasFavorite =
                                  restaurant.isFavorite.value;
                              filterController.toggleFavorite(restaurant.id);
                              Get.snackbar(
                                'รายการโปรด',
                                !wasFavorite
                                    ? 'เพิ่ม ${restaurant.restaurantName} ในรายการโปรดแล้ว'
                                    : 'ลบ ${restaurant.restaurantName} ออกจากรายการโปรดแล้ว',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.black.withValues(
                                  alpha: 0.1,
                                ),
                                colorText: Colors.black,
                                duration: const Duration(milliseconds: 900),
                              );
                            }
                            
                          : () {
                              Get.snackbar(
                                'System',
                                'กรุณาเข้าสู่ระบบเพื่อเพิ่มร้านค้าในรายการโปรด',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.black.withValues(
                                  alpha: 0.1,
                                ),
                                colorText: Colors.black,
                                duration: const Duration(milliseconds: 900),
                              );
                            },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        Dotline(
          gradientColors: LinearGradient(
            colors: [Colors.blue.shade50, Colors.pink.shade200],
          ),
          height: 4,
          dashWidth: 6,
        ),
      ],
    );
  }
}
