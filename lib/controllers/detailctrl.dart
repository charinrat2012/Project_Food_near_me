// lib/controllers/detailctrl.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/controllers/reviewctrl.dart';
import 'package:food_near_me_app/views/login_ui.dart';

import 'package:food_near_me_app/controllers/filterctrl.dart';

import '../model/restaurant.dart';

class RestaurantDetailController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();
  late final ReviewController _reviewController;
  late final FilterController _filterController;

  final TextEditingController commentController = TextEditingController();
  final RxDouble userRating = 0.0.obs;
  final String restaurantId;

  final Rx<Restaurant?> restaurant = Rx<Restaurant?>(null); // เก็บ Restaurant object ที่ reactive ได้

  final RxList<Map<String, dynamic>> reviews = <Map<String, dynamic>>[].obs;

  RestaurantDetailController({required this.restaurantId});

  @override
  void onInit() {
    super.onInit();
    _reviewController = Get.find<ReviewController>();
    _filterController = Get.find<FilterController>();

    // *** ส่วนสำคัญ: เฝ้าดู allRestaurantsObservable ของ FilterController
    // เพื่อให้แน่ใจว่า restaurant object ใน DetailController เป็น instance ล่าสุดเสมอ ***
    ever(_filterController.allRestaurantsObservable, (_) {
      _loadRestaurantDetails(); // โหลดข้อมูลร้านใหม่เมื่อ allRestaurantsObservable เปลี่ยน
    });

    _loadRestaurantDetails(); // โหลดข้อมูลครั้งแรก
    
    // Listener สำหรับ isOpen และ isFavorite ของ Restaurant object ที่อยู่ใน DetailController
    // (ใช้ Obx ใน UI แทน if (restaurant.value != null))
    // Note: This ever listener ensures that if `restaurant.value` is updated (e.g., after `_loadRestaurantDetails`),
    // and its internal RxBools change, the UI rebuilds. This is robust.
    if (restaurant.value != null) {
      ever(restaurant.value!.isOpen, (_) => restaurant.refresh());
      ever(restaurant.value!.isFavorite, (_) => restaurant.refresh());
    }
    
    _loadReviews();
  }

  void _loadRestaurantDetails() {
    // ดึง Restaurant object จาก allRestaurantsObservable ใน FilterController
    // เพื่อให้แน่ใจว่าเป็น reference เดียวกันและ reactive ได้
    final newRestaurantInstance = _filterController.allRestaurantsObservable.firstWhereOrNull((res) => res.id == restaurantId);
    
    // อัปเดต restaurant.value และ trigger UI update
    restaurant.value = newRestaurantInstance;

    // อัปเดต isOpen และ isFavorite ด้วย

  }

  void _loadReviews() {
    reviews.assignAll(_reviewController.getReviewsForRestaurant(restaurantId));
  }

  void submitReview() {
    if (loginController.isLoggedIn.value) {
      if (commentController.text.isNotEmpty && userRating.value > 0) {
        final newReview = {
          'user': loginController.userName.value,
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
      } else {
        Get.snackbar(
          'ข้อผิดพลาด',
          'โปรดให้คะแนนและเขียนคอมเมนต์ให้ครบถ้วนก่อนส่ง',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[400],
          colorText: Colors.white,
        );
      }
    } else {
      Get.defaultDialog(
        title: 'แจ้งเตือน',
        content: Column(
          children: [
            const Text('กรุณาเข้าสู่ระบบก่อนทำการรีวิว'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => LoginUi());
              },
              child: const Text("ตกลง"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }

  void onRatingChanged(double newRating) {
    userRating.value = newRating;
  }
}