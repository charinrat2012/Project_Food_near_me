// lib/controllers/myshop_ctrl.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart'; // เพิ่ม import นี้สำหรับ Colors

class MyshopController extends GetxController {
  // สถานะการเปิด/ปิดร้าน (จะใช้กับ StatusTag)
  final String imageUrl;
  final String restaurantName;
  final String description;
  final double rating;
  final RxBool isOpen; // *** ยังคงรับเป็น RxBool เพื่อให้สถานะแยกกัน ***
  final bool showMotorcycleIcon;
  final VoidCallback? onTap;

  MyshopController({
    required this.imageUrl,
    required this.restaurantName,
    required this.description,
    required this.rating,
    required this.isOpen,
    required this.showMotorcycleIcon,
    this.onTap,
  });
}