// lib/views/myshop_ui.dart
import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/myshopwid/shoplist.dart';
import 'package:get/get.dart';

// Import Controllers
import '../controllers/detailctrl.dart';
import '../controllers/myshopctrl.dart';
import '../controllers/scrollctrl.dart';


// Import Widgets
import '../widgets/matwid/appbarA.dart';
import 'details_ui.dart';
import 'login_ui.dart';

import '../widgets/matwid/scrolltotop_bt.dart';
// import 'widgets/matwid/star_rating.dart'; // ไม่ใช้แล้วเพราะ MyShopCard จัดการเอง
// import 'widgets/matwid/statustag.dart'; // ไม่ใช้แล้ว

// *** Import MyShopCard ที่สร้างใหม่ ***

import '../widgets/myshopwid/shopcard.dart';

// Helper Widget สำหรับขอบ Gradient (ถ้าคุณต้องการ)
// ควรย้ายไปอยู่ในไฟล์แยกต่างหาก (เช่น common/gradient_border.dart)
// ถ้าไม่ใช้ gradient border กับ MyShopCard ก็สามารถลบ class นี้ออกได้

class MyshopUi extends StatelessWidget {
  const MyshopUi({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController = Get.find<ScrollpageController>();
    // Get.put(MyshopController()); // ไม่ต้อง Get.put MyShopController ที่นี่แล้ว

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
                              

                              // *** วนลูป Shoplist.shopList และส่งค่าที่ถูกต้องให้ MyShopCard ***
                              ...Shoplist.shopList.map((restaurantData) {
                                return MyShopCard(
                                  imageUrl: restaurantData['imageUrl']!,
                                  restaurantName: restaurantData['restaurantName']!,
                                  description: restaurantData['description']!,
                                  rating: restaurantData['rating']!,
                                  isOpen: restaurantData['isOpen']!, // *** ส่ง RxBool เข้าไปตรงๆ ***
                                  showMotorcycleIcon: restaurantData['showMotorcycleIcon']!,
                                  onTap: () {
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
                              const SizedBox(height: 80), // เพิ่มระยะห่างด้านล่างสุด
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