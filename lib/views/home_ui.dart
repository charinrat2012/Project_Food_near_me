
import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/filterctrl.dart';
import 'package:get/get.dart';

import '../controllers/detailctrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/homewid/LocationFilterBar.dart';
import '../widgets/matwid/formsearch.dart';
import '../widgets/homewid/rescard.dart';
import '../widgets/homewid/reslist.dart';
import '../widgets/homewid/slideim.dart';

import '../widgets/matwid/appbarA.dart';
import '../widgets/matwid/scrolltotop_bt.dart';
import 'details_ui.dart';
import 'login_ui.dart';
import 'myprofile_ui.dart';

class HomeUi extends StatelessWidget {
   const HomeUi({super.key});

  
    @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>();
    final FilterController filterController = Get.find<FilterController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: const AppbarA(),
        
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
            Colors.blue[200]!,
            Colors.pink[200]!,
          ])
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
                              // ใช้ .map เพื่อสร้าง RestaurantCard จาก restaurantList
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
                              children: filterController.filteredRestaurantList.map((restaurantData) {
                                return RestaurantCard(
                                  imageUrl: restaurantData['imageUrl']!,
                                  restaurantName: restaurantData['restaurantName']!,
                                  description: restaurantData['description']!,
                                  rating: restaurantData['rating']!,
                                  isOpen: restaurantData['isOpen']!,
                                  showMotorcycleIcon: restaurantData['showMotorcycleIcon']!,
                                  onTap: () {
                                    // Use Get.to instead of Get.offAll to allow going back
                                    Get.offAll(
                                      () => RestaurantDetailPageUi(
                                        restaurantId: restaurantData['id']!,
                                      ),
                                      binding: BindingsBuilder(() {
                                        Get.put(
                                          RestaurantDetailController(
                                            restaurantId: restaurantData['id']!,
                                          ),
                                          tag: restaurantData['id']!,
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