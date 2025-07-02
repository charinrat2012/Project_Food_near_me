import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/restaurant_detail_ctrl.dart';
import '../../controllers/myshop_ctrl.dart';
import '../../views/restaurant_details_ui.dart';
import 'my_shop_card.dart';

class Showshopcard extends StatelessWidget {
  const Showshopcard({super.key});

  @override
  Widget build(BuildContext context) {
    final MyShopController controller = Get.find<MyShopController>();
    return Column(
      children: [
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...controller.myOwnerShopList.map((restaurant) {
                return MyShopCard(
                  imageUrl: restaurant.imageUrl,
                  restaurantName: restaurant.restaurantName,
                  description: restaurant.description,
                  rating: restaurant.rating,
                  isOpen: restaurant.isOpen,
                  showMotorcycleIcon: restaurant.showMotorcycleIcon,
                  shopId: restaurant.id,
                  onTap: () {
                    Get.to(
                      () => RestaurantDetailPageUi(restaurantId: restaurant.id),
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
      ],
    );
  }
}
