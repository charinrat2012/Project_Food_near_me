// lib/widgets/myshopwid/shopcard.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../matwid/star_rating.dart';
import '../matwid/statustag.dart';
import '../../controllers/myshopctrl.dart';

class MyShopCard extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final String description;
  final double rating;
  final RxBool isOpen;
  final bool showMotorcycleIcon;
  final VoidCallback? onTap;
  final String shopId;

  const MyShopCard({
    super.key,
    required this.imageUrl,
    required this.restaurantName,
    required this.description,
    this.rating = 0.0,
    required this.isOpen,
    this.showMotorcycleIcon = false,
    this.onTap,
    required this.shopId,
  });

  @override
  Widget build(BuildContext context) {
   
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurantName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        description,
                        style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StarRating(
                            rating: rating,
                            size: 10,
                            onRatingChanged: (newRating) {},
                          ),
                         
                         
                         
                          Obx(
                            () => StatusTag(
                              isOpen: isOpen.value,
                              showMotorcycleIcon: showMotorcycleIcon,
                              iconSize: 16,
                              showOpenStatus: false,
                            ),
                          ),
                          const SizedBox(width: 8.0),

                          Obx(
                            () => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  isOpen.value ? "เปิด" : "ปิด",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: isOpen.value ? Colors.green : Colors.red,
                                  ),
                                ),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Switch.adaptive(
                                    value: isOpen.value,
                                    onChanged: (newValue) {
                                     
                                      Get.find<MyShopController>().toggleShopStatus(shopId, newValue);

                                      Get.snackbar(
                                        'สถานะร้านค้า',
                                        isOpen.value ? 'ร้าน ${restaurantName} เปิดแล้ว!' : 'ร้าน ${restaurantName} ปิดแล้ว!',
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: isOpen.value ? Colors.green : Colors.red,
                                        colorText: Colors.white,
                                        duration: const Duration(milliseconds: 800),
                                      );
                                    },
                                    activeColor: Colors.green,
                                    inactiveThumbColor: Colors.red,
                                    inactiveTrackColor: Colors.red.shade100,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}