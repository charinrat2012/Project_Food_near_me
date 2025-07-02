import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/restaurant_detail_ctrl.dart';
import '../../controllers/filte_rctrl.dart';
import '../../views/restaurant_details_ui.dart';
import 'home_restaurant_card.dart';

class ShowCardHome extends StatelessWidget {
  const ShowCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    final FilterController filterController = Get.find<FilterController>();
    return Obx(() {
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
    });
  }
}
