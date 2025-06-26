// lib/models/restaurant_model.dart
import 'package:get/get.dart';

class Restaurant {
  final String id;
  final String imageUrl;
  final String ownerId;
  final String restaurantName;
  final String description;
  final double rating;
  final RxBool isOpen;
  final bool showMotorcycleIcon;
  final String details;
  final String openingHours;
  final String phoneNumber;
  final String location;
  final String menuImage;
  final String bannerImage;
  final String type;
  final RxBool isFavorite;


  Restaurant({
    required this.id,
    required this.imageUrl,
    required this.ownerId,
    required this.restaurantName,
    required this.description,
    required this.rating,
    required bool isOpen,
    required this.showMotorcycleIcon,
    required this.details,
    required this.openingHours,
    required this.phoneNumber,
    required this.location,
    required this.menuImage,
    required this.bannerImage,
    required this.type,
    bool? isFavorite,
  }) : this.isOpen = isOpen.obs,
       this.isFavorite = (isFavorite ?? false).obs;

 
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      ownerId: map['ownerid'] as String,
      restaurantName: map['restaurantName'] as String,
      description: map['description'] as String,
      rating: (map['rating'] as num).toDouble(),
      isOpen: map['isOpen'] as bool,
      showMotorcycleIcon: map['showMotorcycleIcon'] as bool,
      details: map['details'] as String,
      openingHours: map['openingHours'] as String,
      phoneNumber: map['phoneNumber'] as String,
      location: map['location'] as String,
      menuImage: map['menuimage'] as String,
      bannerImage: map['bannerImage'] as String,
      type: map['type'] as String,
      isFavorite: map['isFavorite'] as bool? ?? false,
    );
  }

 
  Restaurant copyWith({
    String? id,
    String? imageUrl,
    String? ownerId,
    String? restaurantName,
    String? description,
    double? rating,
    bool? isOpen,
    bool? showMotorcycleIcon,
    String? details,
    String? openingHours,
    String? phoneNumber,
    String? location,
    String? menuImage,
    String? bannerImage,
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
      isOpen: isOpen ?? this.isOpen.value,
      showMotorcycleIcon: showMotorcycleIcon ?? this.showMotorcycleIcon,
      details: details ?? this.details,
      openingHours: openingHours ?? this.openingHours,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      menuImage: menuImage ?? this.menuImage,
      bannerImage: bannerImage ?? this.bannerImage,
      type: type ?? this.type,
      isFavorite: isFavorite ?? this.isFavorite.value,
    );
  }
}