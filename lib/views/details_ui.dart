import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'controllers/detailctrl.dart'; // ตรวจสอบว่า import ถูกต้อง
import 'widgets/matwid/back_bt.dart';
import 'widgets/matwid/dotline.dart';
import 'widgets/matwid/star_rating.dart';
import 'widgets/matwid/statustag.dart';

class RestaurantDetailPageUi extends StatelessWidget {
  final String restaurantId;

  const RestaurantDetailPageUi({
    super.key,
    required this.restaurantId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantDetailController>(tag: restaurantId); 

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: const Align(
            alignment: Alignment.centerLeft,
            child: BackBt(),
          ),
          toolbarHeight: 8 * 12,
          automaticallyImplyLeading: false,
          actions: [
            Image.asset(
              "assets/imgs/logoHome.png",
              height: 8 * 10,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Obx(() {
          if (controller.restaurantData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final restaurantData = controller.restaurantData;

          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Dotline(
                    color: Colors.pink.shade200,
                    height: 4,
                    dashWidth: 6,
                  ),
                  // **แก้ไขตรงนี้: เพิ่ม Hero widget รอบ Image.asset**
                  Hero(
                    tag: 'restaurant_image_${restaurantId}', // **Tag ต้องตรงกันกับใน RestaurantCard**
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Image.asset(
                        restaurantData['imageUrl']!,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Dotline(
                    color: Colors.pink.shade50,
                    height: 4,
                    dashWidth: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Container(
                      height: 8 * 7,
                      color: Colors.pink.shade50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            restaurantData['restaurantName']!,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          StatusTag(
                            isOpen: restaurantData['isOpen']!,
                            showMotorcycleIcon: restaurantData['showMotorcycleIcon']!,
                            fontSize: 14,
                            showOpenStatus: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Dotline(
                    color: Colors.pink.shade50,
                    height: 4,
                    dashWidth: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurantData['details']!,
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "เวลาเปิดร้าน:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        Text(
                          restaurantData['openingHours']!,
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "เบอร์โทร: ${restaurantData['phoneNumber']!}",
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "พิกัดที่ตั้ง: ${restaurantData['location']!}",
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 15.0),
                        StarRating(rating: restaurantData['rating']!, size: 20),
                        const SizedBox(height: 10.0),
                        Text(
                          "เมนูแนะนำ:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Image.asset(
                              restaurantData['menuimage']!,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "โปรโมชั่น:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            restaurantData['bannerImage']!,
                            height: 8 * 11,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Dotline(
                          color: Colors.pink.shade200,
                          height: 4,
                          dashWidth: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            "รีวิวจากลูกค้า",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Dotline(
                          color: Colors.pink.shade200,
                          height: 4,
                          dashWidth: 6,
                        ),
                        const SizedBox(height: 20.0),

                        Container(
                          height: 300, 
                          width: double.infinity,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.pink.shade50,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Obx(() {
                            if (controller.reviews.isEmpty) {
                              return const Text(
                                "ยังไม่มีรีวิวสำหรับร้านนี้",
                                style: TextStyle(
                                    fontSize: 16.0, fontStyle: FontStyle.italic),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: controller.reviews.length,
                                itemBuilder: (context, index) {
                                  final review = controller.reviews[index];
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 15.0),
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  review['user'],
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              StarRating(
                                                  rating: review['rating'], size: 16),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Text(
                                            review['comment'],
                                            style: const TextStyle(fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          }),
                        ),

                        const SizedBox(height: 30.0),
                        Text(
                          "เขียนรีวิวของคุณ",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink[700],
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              const Text(
                                "ให้คะแนน: ",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Obx(() => StarRating(
                                      rating: controller.userRating.value,
                                      size: 24,
                                      onRatingChanged: controller.onRatingChanged,
                                    )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        TextField(
                          controller: controller.commentController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "เขียนความคิดเห็นของคุณที่นี่...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.pink.shade400, width: 2.0),
                            ),
                            contentPadding: const EdgeInsets.all(15.0),
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        Center(
                          child: ElevatedButton(
                            onPressed: controller.submitReview,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[400],
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              "ส่งรีวิว",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}