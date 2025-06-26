// lib/views/home_ui.dart
import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/filterctrl.dart';
import 'package:get/get.dart';


import '../controllers/detailctrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/homewid/LocationFilterBar.dart';
import '../widgets/matwid/formsearch.dart';
import '../widgets/homewid/rescard.dart';
// import '../widgets/matwid/reslist.dart'; // ไม่จำเป็นต้อง import reslist โดยตรงแล้วที่นี่
import '../widgets/homewid/slideim.dart';

import '../widgets/matwid/appbarA.dart';
import '../widgets/matwid/scrolltotop_bt.dart';
import 'details_ui.dart';
// import 'login_ui.dart'; // ไม่จำเป็นต้อง import ที่นี่
// import 'myprofile_ui.dart'; // ไม่จำเป็นต้อง import ที่นี่

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController = Get.find<ScrollpageController>();
    final FilterController filterController = Get.find<FilterController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // Get.closeCurrentSnackbar();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: const AppbarA(),
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
                              const Formsearch(),
                              const LocationFilterBar(),
                              const SizedBox(height: 8),
                              Slideim(),
                              const SizedBox(height: 8),
                              Obx(() {
                                if (filterController.filteredRestaurantList.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      'ไม่พบร้านอาหารที่ตรงกับการค้นหา',
                                      style: TextStyle(fontSize: 18, color: Colors.grey),
                                    ),
                                  );
                                }
                                return Column(
                                  children: filterController.filteredRestaurantList.map((restaurant) {
                                    // *** แก้ไขตรงนี้ทั้งหมด: ใช้ . (dot operator) แทน [] (bracket operator) ***
                                    return RestaurantCard(
                                      imageUrl: restaurant.imageUrl,
                                      restaurantName: restaurant.restaurantName,
                                      description: restaurant.description,
                                      rating: restaurant.rating,
                                      isOpen: restaurant.isOpen.value,
                                      showMotorcycleIcon: restaurant.showMotorcycleIcon,
                                      onTap: () {
                                        Get.offAll(
                                          () => RestaurantDetailPageUi(
                                            restaurantId: restaurant.id, // ใช้ .id
                                          ),
                                          binding: BindingsBuilder(() {
                                            Get.put(
                                              RestaurantDetailController(
                                                restaurantId: restaurant.id, // ใช้ .id
                                              ),
                                              tag: restaurant.id, // ใช้ .id
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
              Obx(
                () => scrollpageController.showScrollToTopButton.value
                    ? Positioned(
                        right: 20.0,
                        bottom: MediaQuery.of(context).padding.bottom + 16.0,
                        child: ScrollToTopButton(
                          onPressed: scrollpageController.scrollToTop,
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}