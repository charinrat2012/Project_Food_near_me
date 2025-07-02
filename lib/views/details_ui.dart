// lib/views/details_ui.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/editedetail_ui.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/widgets/detailswid/description.dart';
import 'package:food_near_me_app/widgets/detailswid/head_detail.dart';
import 'package:food_near_me_app/widgets/detailswid/menu.dart';
import 'package:food_near_me_app/widgets/detailswid/review.dart';
import 'package:food_near_me_app/widgets/matwid/bt_scrolltop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/detailctrl.dart';
import '../controllers/editedetailctrl.dart';
import '../controllers/filterctrl.dart';
import '../controllers/loginctrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/detailswid/appbar_detail.dart';
import '../widgets/detailswid/banner.dart';
import '../widgets/detailswid/head_image.dart';
import '../widgets/matwid/back2_bt.dart';
import '../widgets/matwid/back3_bt.dart';
import '../widgets/matwid/back_bt.dart';
import '../widgets/matwid/dotline.dart';
import '../widgets/matwid/star_rating.dart';
import '../widgets/matwid/statustag.dart';
// import '../models/restaurant_model.dart';
import 'navbar_ui.dart';

class RestaurantDetailPageUi extends StatelessWidget {
  final String restaurantId;
  const RestaurantDetailPageUi({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    // final LoginController loginController = Get.find<LoginController>();
    // final FilterController filterController = Get.find<FilterController>();
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>(tag: 'detail_scroll');
    final RestaurantDetailController controller =
        Get.find<RestaurantDetailController>(tag: restaurantId);
    final restaurant = controller.restaurant.value!;
    final List<String> menuImages = restaurant.menuImages;
    final List<String> bannerImages = restaurant.bannerImages;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppbarDetail(restaurantId: restaurantId),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[200]!, Colors.pink[200]!],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollpageController.scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(() {
                              if (controller.restaurant.value == null) {
                                return const Column(
                                  children: [
                                    Expanded(child: SizedBox()),
                                    Center(child: CircularProgressIndicator()),
                                    Expanded(child: SizedBox()),
                                  ],
                                );
                              }

                              return Column(
                                children: [
                                  HeadImage(restaurantId: restaurantId),
                                  HeadDetail(restaurantId: restaurantId),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Description(restaurantId: restaurantId),
                                        const SizedBox(height: 20),
                                        Menu(menuImages: menuImages),

                                        const SizedBox(height: 20),
                                        Promotion(bannerImages: bannerImages),
                                        const SizedBox(height: 30.0),
                                        Review(restaurantId: restaurantId),

                                        const SizedBox(height: 30.0),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BtScrollTop(tag: 'detail_scroll'),
            ],
          ),
        ),
      ),
    );
  }
}
