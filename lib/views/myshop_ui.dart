import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/matwid/bt_scrolltop.dart';

import 'package:get/get.dart';

import '../controllers/detailctrl.dart';
import '../controllers/myshopctrl.dart';
import '../controllers/scrollctrl.dart';

import '../widgets/matwid/appbarA.dart';
import 'details_ui.dart';

import '../widgets/matwid/scrolltotop_bt.dart';

import '../widgets/myshopwid/shopcard.dart';

class MyshopUi extends StatelessWidget {
  const MyshopUi({super.key});

  @override
  Widget build(BuildContext context) {
    
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>(tag: 'myshop_scroll');

    final MyShopController myshopController = Get.find<MyShopController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: const AppbarA(tag: 'myshop filter ctrl'),
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          controller: scrollpageController.scrollController,
                          padding: const EdgeInsets.all(16.0),
                          child: Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...myshopController.myOwnerShopList.map((
                                  restaurant,
                                ) {
                                  return MyShopCard(
                                    imageUrl: restaurant.imageUrl,
                                    restaurantName: restaurant.restaurantName,
                                    description: restaurant.description,
                                    rating: restaurant.rating,
                                    isOpen: restaurant.isOpen,
                                    showMotorcycleIcon:
                                        restaurant.showMotorcycleIcon,
                                    shopId: restaurant.id,
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
                                const SizedBox(height: 80),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BtScrollTop(tag: 'myshop_scroll'),
            ],
          ),
        ),
      ),
    );
  }
}
