// lib/views/widgets/myshopwid/shopcard.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // จำเป็นต้องใช้ GetX สำหรับ RxBool และ Obx
import '../matwid/star_rating.dart';
import '../matwid/statustag.dart'; // ตรวจสอบ Path ไปยัง StatusTag ของคุณ (ที่ไม่ถูกแก้)

class MyShopCard extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final String description;
  final double rating;
  final RxBool isOpen; // *** ยังคงรับเป็น RxBool เพื่อให้สถานะแยกกัน ***
  final bool showMotorcycleIcon;
  final VoidCallback? onTap;

  const MyShopCard({
    super.key,
    required this.imageUrl,
    required this.restaurantName,
    required this.description,
    this.rating = 0.0,
    required this.isOpen, // ต้องรับ RxBool
    this.showMotorcycleIcon = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),

      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          
          // gradient:  LinearGradient(
          //   colors: [
          //     // Colors.blue[100]!,
          //     // Colors.red[100]!,
          //     // Colors.pink[50]!,
              
          //     Colors.lightBlue[100]!,
          //     // Colors.amber[50]!,
          //     Colors.white,
          //   ]
           
          // ),
          // boxShadow:  [
          //   BoxShadow(
              
          //     // color: Colors.pink.withValues(alpha: 8 * 0.03),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 3),
          //   )
          // ]
          
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
                              StatusTag(
                                isOpen: isOpen.value, // *** ส่ง isOpen.value (bool) ไปให้ StatusTag ***
                                showMotorcycleIcon: showMotorcycleIcon,
                                
                                iconSize: 16, // ถ้า StatusTag ของคุณมี prop iconSize ก็ใส่ไปได้เลย
                                showOpenStatus: false, // ถ้า StatusTag ของคุณมี prop นี้
                              ),
                          // *** ส่วนของ StatusTag และ Toggle Switch (อยู่ขวาล่าง) ***
                          Obx(() => Row( // ใช้ Obx ครอบ Row นี้เพื่อให้ทั้ง StatusTag และ Toggle Switch อัปเดตพร้อมกัน
                            mainAxisSize: MainAxisSize.min, // ให้ Row ใช้พื้นที่เท่าที่จำเป็น
                            children: [
                              // StatusTag (เหมือนเดิม)
                              const SizedBox(width: 8.0), // ระยะห่างระหว่าง StatusTag กับ Toggle

                              // Toggle Switch และ Text "เปิด/ปิด"
                              // เราไม่จำเป็นต้องมี Obx ซ้อนตรงนี้แล้ว เพราะ Obx ด้านบนครอบทั้ง Row แล้ว
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
                                    isOpen.value = newValue; // เปลี่ยนค่าของ RxBool ที่ส่งเข้ามาโดยตรง
                                    // Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'สถานะร้านค้า',
                                      isOpen.value ? 'ร้าน ${restaurantName} เปิดแล้ว!' : 'ร้าน ${restaurantName} ปิดแล้ว!',
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: isOpen.value ? Colors.green : Colors.red,
                                      colorText: Colors.white,
                                      duration:  Duration(milliseconds: 800),
                                    );
                                  },
                                  activeColor: Colors.green,
                                  inactiveThumbColor: Colors.red,
                                  inactiveTrackColor: Colors.red.shade100,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ],
                          )),
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