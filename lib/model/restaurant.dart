
import 'package:get/get.dart';

class Restaurant {
  final String id;
  final String imageUrl;
  final String ownerId;
  final String restaurantName;
  final String description;
  final double rating;
  final RxBool isOpen; // ยังคงเป็น RxBool
  final bool showMotorcycleIcon;
  final String details;
  final String openingHours;
  final String phoneNumber;
  final String location;
  final List<String> menuImages;
  final List<String> promotion;
  final String type;
  final RxBool isFavorite; // *** เพิ่ม isFavorite เป็น final RxBool ***


  Restaurant({
    required this.id,
    required this.imageUrl,
    required this.ownerId,
    required this.restaurantName,
    required this.description,
    required this.rating,
    required bool isOpen, // รับเป็น bool ธรรมดา
    required this.showMotorcycleIcon,
    required this.details,
    required this.openingHours,
    required this.phoneNumber,
    required this.location,
    required this.menuImages,
    required this.promotion,
    required this.type,
    bool? isFavorite, // *** รับ isFavorite เป็น bool ธรรมดา และเป็น optional parameter ***
  }) : this.isOpen = isOpen.obs, // Initializer สำหรับ isOpen
       this.isFavorite = (isFavorite ?? false).obs; // *** Initializer สำหรับ isFavorite ***

  // Factory constructor สำหรับสร้าง Object จาก Map (เช่นจาก Reslist)
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      ownerId: map['ownerid'] as String, // ชื่อ key ใน Map คือ 'ownerid'
      restaurantName: map['restaurantName'] as String,
      description: map['description'] as String,
      rating: (map['rating'] as num).toDouble(),
      isOpen: map['isOpen'] as bool, // รับ bool จาก map
      showMotorcycleIcon: map['showMotorcycleIcon'] as bool,
      details: map['details'] as String,
      openingHours: map['openingHours'] as String,
      phoneNumber: map['phoneNumber'] as String,
      location: map['location'] as String,
      menuImages: List<String>.from(map['menuImages'] ?? []),
      promotion: List<String>.from(map['promotion'] ?? []),
      type: map['type'] as String,
      isFavorite: map['isFavorite'] as bool? ?? false, // *** รับ isFavorite จาก map ถ้าไม่มีให้เป็น false ***
    );
  }

  // เมธอด copyWith เพื่อสร้าง Object ใหม่พร้อม Property ที่เปลี่ยนแปลง
  Restaurant copyWith({
    String? id,
    String? imageUrl,
    String? ownerId,
    String? restaurantName,
    String? description,
    double? rating,
    bool? isOpen, // ตรงนี้รับเป็น bool ธรรมดา
    bool? showMotorcycleIcon,
    String? details,
    String? openingHours,
    String? phoneNumber,
    String? location,
   List<String>? menuImages,
    List<String>? promotion,
    String? type,
    bool? isFavorite, 
  }) {
    return Restaurant(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      ownerId: ownerId ?? this.ownerId,
      restaurantName: restaurantName ?? this.restaurantName,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      isOpen: isOpen ?? this.isOpen.value, // ใช้ .value เพื่อให้รับ bool
      showMotorcycleIcon: showMotorcycleIcon ?? this.showMotorcycleIcon,
      details: details ?? this.details,
      openingHours: openingHours ?? this.openingHours,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      menuImages: menuImages ?? this.menuImages,
      promotion: promotion ?? this.promotion,
      type: type ?? this.type,
      isFavorite: isFavorite ?? this.isFavorite.value, // *** ใช้ .value เพื่อให้รับ bool ***
    );
  }
}