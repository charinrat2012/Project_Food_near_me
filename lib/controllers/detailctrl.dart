import 'package:food_near_me_app/widgets/homewid/reslist.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/reviewctrl.dart';
import 'package:food_near_me_app/views/home_ui.dart';

import '../widgets/homewid/reslist.dart' as ResList;


class RestaurantDetailController extends GetxController {
  final TextEditingController commentController = TextEditingController();
  final RxDouble userRating = 0.0.obs;
  final String restaurantId;
  final RxMap<String, dynamic> restaurantData = <String, dynamic>{}.obs;
  late final ReviewController _reviewController;
  final RxList<Map<String, dynamic>> reviews = <Map<String, dynamic>>[].obs;
  RestaurantDetailController({required this.restaurantId});
  @override



  void onInit() {
    super.onInit();
    _reviewController = Get.find<ReviewController>();
    final foundRestaurant = Reslist.restaurantList.firstWhereOrNull(
      (restaurant) => restaurant['id'] == restaurantId,
    );
    if (foundRestaurant != null) {
      restaurantData.value = Map<String, dynamic>.from(foundRestaurant); 
      print('RestaurantDetailController: Loaded restaurant data for ID: $restaurantId');
    } else {
      print('Error: Restaurant data not found for ID: $restaurantId');
      Get.snackbar('ข้อผิดพลาด', 'ไม่พบข้อมูลร้านค้า', snackPosition: SnackPosition.TOP);
    }
    _loadReviews();
  }
  void _loadReviews() {
    // reviews.value = _reviewController.getReviewsForRestaurant(restaurantId);
    reviews.assignAll(_reviewController.getReviewsForRestaurant(restaurantId));
    print('RestaurantDetailController: Loaded reviews for ID: $restaurantId, count: ${reviews.length}');
  }
  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
  void onRatingChanged(double newRating) {
    userRating.value = newRating;
  }
  void submitReview() {
    if (commentController.text.isNotEmpty && userRating.value > 0) {
      final newReview = {
        'user': 'ผู้ใช้ใหม่ (คุณ)', 
        'rating': userRating.value,
        'comment': commentController.text,
      };
      _reviewController.addReview(restaurantId, newReview);
      _loadReviews(); 
      commentController.clear();
      userRating.value = 0.0;
      Get.snackbar(
        'ส่งรีวิวแล้ว',
        'รีวิวของคุณถูกส่งเรียบร้อยแล้วค่ะ!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[400],
        colorText: Colors.white,
      );
      print('RestaurantDetailController: Review submitted for ID: $restaurantId, new total reviews: ${reviews.length}');
    } else {
      Get.snackbar(
        'ข้อผิดพลาด',
        'โปรดให้คะแนนและเขียนคอมเมนต์ให้ครบถ้วนก่อนส่ง',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
      );
    }
  }
}