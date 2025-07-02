import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/matwid/bt_scrolltop.dart';
import 'package:get/get.dart';

import 'package:food_near_me_app/controllers/filterctrl.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/controllers/scrollctrl.dart';
import 'package:food_near_me_app/widgets/matwid/formsearch.dart';
import 'package:food_near_me_app/widgets/homewid/rescard.dart';
import 'package:food_near_me_app/widgets/matwid/appbarA.dart';
import 'package:food_near_me_app/widgets/matwid/scrolltotop_bt.dart';
import 'package:food_near_me_app/views/details_ui.dart';
import 'package:food_near_me_app/controllers/detailctrl.dart';



class FavoriteUi extends StatelessWidget {
  const FavoriteUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController = Get.find<ScrollpageController>(tag: 'favorite_scroll');
    final FilterController filterController = Get.find<FilterController>();
    // final FilterController filterController = Get.find<FilterController>();
    final LoginController loginController = Get.find<LoginController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: const AppbarA(tag: 'favorite filter ctrl',),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue[200]!,
              Colors.pink[200]!,
            ]),
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          controller: scrollpageController.scrollController,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Formsearch(tag:'favorite'),
                              const SizedBox(height: 8),

                              Obx(() {
                                if (!loginController.isLoggedIn.value) {
                                  return const Center(
                                    child: Text(
                                      'กรุณาเข้าสู่ระบบเพื่อดูรายการโปรด',
                                      style: TextStyle(fontSize: 18, color: Colors.grey),
                                    ),
                                  );
                                }
                                if (filterController.filteredFavoriteList.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      'ไม่พบร้านอาหารที่ตรงกับการค้นหา หรือคุณยังไม่มีร้านอาหารในรายการโปรด',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18, color: Colors.grey),
                                    ),
                                  );
                                }
                                return Column(
                                  children: filterController.filteredFavoriteList.map((restaurant) {
                                    return RestaurantCard(
                                      imageUrl: restaurant.imageUrl,
                                      restaurantName: restaurant.restaurantName,
                                      description: restaurant.description,
                                      rating: restaurant.rating,
                                      isOpen: restaurant.isOpen.value,
                                      showMotorcycleIcon: restaurant.showMotorcycleIcon,
                                      onTap: () {
                                        Get.to(
                                          () => RestaurantDetailPageUi(
                                            restaurantId: restaurant.id,
                                          ),
                                          binding: BindingsBuilder(() {
                                            Get.put(
                                              RestaurantDetailController(
                                                restaurantId: restaurant.id,
                                              ),
                                              tag: restaurant.id,
                                            );
                                          }),
                                        );
                                      },
                                    );
                                  }).toList(),
                                );
                              }),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             BtScrollTop(tag: 'favorite_scroll'),
            ],
          ),
        ),
      ),
    );
  }
}