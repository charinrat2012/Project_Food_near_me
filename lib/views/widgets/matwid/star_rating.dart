// lib/views/widgets/star_rating.dart

import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size; // เพิ่มขนาดของดาวให้ปรับได้

  const StarRating({
    super.key,
    required this.rating,
    this.size = 10, // กำหนดค่าเริ่มต้นตามที่คุณใช้ใน RestaurantCard
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(
            Icons.star,
            color: Colors.pink,
            size: size, // ใช้ size ที่รับมา
          );
        } else if (index == rating.floor() && (rating % 1 != 0)) {
          return Icon(
            Icons.star_half,
            color: Colors.pink,
            size: size, // ใช้ size ที่รับมา
          );
        } else {
          return Icon(
            Icons.star_border,
            color: Colors.pink,
            size: size, // ใช้ size ที่รับมา
          );
        }
      }),
    );
  }
}