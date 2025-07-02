import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/detailctrl.dart';
import '../matwid/star_rating.dart';
import '../matwid/statustag.dart';

class Description extends StatelessWidget {
  final String restaurantId;
  const Description({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailController controller = Get.find<RestaurantDetailController>(tag: restaurantId);
        final restaurant = controller.restaurant.value!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurant.details,
          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
        ),
        const SizedBox(height: 10.0),
        Text(
          "เวลาเปิดร้าน: ${restaurant.openingHours}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        const SizedBox(height: 5.0),
        Text(
          "เบอร์โทร: ${restaurant.phoneNumber}",
          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
        ),
        const SizedBox(height: 5.0),
        Text(
          "พิกัดที่ตั้ง: ${restaurant.location}",
          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
        ),
        const SizedBox(width: 8),
        Obx(
          () => StatusTag(
            isOpen: restaurant.isOpen.value,
            showMotorcycleIcon: restaurant.showMotorcycleIcon,
            fontSize: 14,
            iconSize: 32,
            showOpenStatus: false,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            StarRating(
              rating: restaurant.rating,
              size: 20,
              onRatingChanged: (newRating) {},
            ),
            const SizedBox(width: 10),
            Text(
              "ประเภท: ${restaurant.type}",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.pink[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
