import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/restaurant_detail_ctrl.dart';
import '../material_widget/dotline.dart';
import '../material_widget/star_rating.dart';

class Review extends StatelessWidget {
  final String restaurantId;
  const Review({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailController controller =
        Get.find<RestaurantDetailController>(tag: restaurantId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Dotline(
          gradientColors: LinearGradient(
            colors: [Colors.blue.shade200, Colors.pink.shade200],
          ),
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
          gradientColors: LinearGradient(
            colors: [Colors.blue.shade200, Colors.pink.shade200],
          ),
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
                style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
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
                              StarRating(rating: review['rating'], size: 16),
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
              const Text("ให้คะแนน: ", style: TextStyle(fontSize: 16.0)),
              Obx(
                () => StarRating(
                  rating: controller.userRating.value,
                  size: 24,
                  onRatingChanged: controller.onRatingChanged,
                ),
              ),
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
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
      ],
    );
  }
}
