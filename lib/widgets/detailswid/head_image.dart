import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/detailctrl.dart';

class HeadImage extends StatelessWidget {
  final String restaurantId;
  const HeadImage({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailController controller =
        Get.find<RestaurantDetailController>(tag: restaurantId);
    final restaurant = controller.restaurant.value!;
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            image: DecorationImage(
              image: AssetImage(restaurant.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
