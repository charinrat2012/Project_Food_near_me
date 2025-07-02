// lib/views/details_ui.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/edit_restaurant_detail_ui.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/widgets/detail_widget/description.dart';
import 'package:food_near_me_app/widgets/detail_widget/detail_head_banner_text.dart';
import 'package:food_near_me_app/widgets/detail_widget/detail_menu_image.dart';
import 'package:food_near_me_app/widgets/detail_widget/review.dart';
import 'package:food_near_me_app/widgets/material_widget/bt_scrolltop.dart';

import 'package:get/get.dart';
import '../controllers/restaurant_detail_ctrl.dart';

import '../controllers/scrollctrl.dart';
import '../widgets/detail_widget/appbar_detail.dart';
import '../widgets/detail_widget/detail_promotion.dart';
import '../widgets/detail_widget/detail_head_image.dart';


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
                              final restaurant = controller.restaurant.value!;
                              final List<String> menuImages =
                                  restaurant.menuImages;
                              final List<String> promotion =
                                  restaurant.promotion;
                              return Column(
                                children: [
                                  DetailHeadImage(restaurantId: restaurantId),
                                  DetailHeadBannerText(restaurantId: restaurantId),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Description(restaurantId: restaurantId),
                                        const SizedBox(height: 20),
                                        DetailMenuImage(menuImages: menuImages),

                                        const SizedBox(height: 20),
                                        Promotion(promotion: promotion),
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
