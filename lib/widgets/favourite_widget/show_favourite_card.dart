import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/restaurant_detail_ctrl.dart';
import '../../controllers/filte_rctrl.dart';
import '../../controllers/login_ctrl.dart';
import '../../views/restaurant_details_ui.dart';
import '../home_widget/home_restaurant_card.dart';

class ShowFavouriteCard extends StatelessWidget {
  const ShowFavouriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    final FilterController filterController = Get.find<FilterController>();
    // final FilterController
    return Column(
      children: [
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
              return HomeRestaurantCard(
                imageUrl: restaurant.imageUrl,
                restaurantName: restaurant.restaurantName,
                description: restaurant.description,
                rating: restaurant.rating,
                isOpen: restaurant.isOpen.value,
                showMotorcycleIcon: restaurant.showMotorcycleIcon,
                onTap: () {
                  Get.to(
                    () => RestaurantDetailPageUi(restaurantId: restaurant.id),
                    binding: BindingsBuilder(() {
                      Get.put(
                        RestaurantDetailController(restaurantId: restaurant.id),
                        tag: restaurant.id,
                      );
                    }),
                  );
                },
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
