import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/controllers/reviewctrl.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/controllers/filterctrl.dart';
import '../model/restaurant.dart';
import '../views/navbar.dart';

class RestaurantDetailController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();
  late final ReviewController _reviewController;
  late final FilterController _filterController;

  final TextEditingController commentController = TextEditingController();
  final RxDouble userRating = 0.0.obs;
  final String restaurantId;

  final Rx<Restaurant?> restaurant = Rx<Restaurant?>(null);
  final RxBool isDeleting = false.obs;

  final RxList<Map<String, dynamic>> reviews = <Map<String, dynamic>>[].obs;

  RestaurantDetailController({required this.restaurantId});

  @override
  void onInit() {
    super.onInit();
    _reviewController = Get.find<ReviewController>();
    _filterController = Get.find<FilterController>();

    // *** จุดแก้ไข: ลบ ever listeners ที่ไม่จำเป็นและอาจทำให้เกิดปัญหาออก ***
    // การอัปเดต UI ควรจะเกิดขึ้นโดยตรงผ่าน Obx ในหน้า UI
    // ซึ่งจะคอยดักฟังการเปลี่ยนแปลงของ restaurant.value.isFavorite อยู่แล้ว
    
    loadRestaurantDetails(); // โหลดข้อมูลครั้งแรก
    _loadReviews();
  }
  void restore() {
    loadRestaurantDetails();
  }

  // ทำให้เป็น public เพื่อให้เรียกจากภายนอกได้ (เช่นหลังแก้ไขข้อมูล)
  void loadRestaurantDetails() {
    final newRestaurantInstance = _filterController.allRestaurantsObservable
        .firstWhereOrNull((res) => res.id == restaurantId);

    restaurant.value = newRestaurantInstance;

    // จัดการกรณีที่อาจหาร้านไม่เจอ (เช่น ร้านถูกลบไปแล้ว)
    if (restaurant.value == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('ข้อผิดพลาด', 'ไม่พบข้อมูลร้านค้า',
            snackPosition: SnackPosition.BOTTOM);
        Get.back(); // กลับไปหน้าก่อนหน้าอย่างปลอดภัย
      });
    }
  }

  void _loadReviews() {
    reviews.assignAll(_reviewController.getReviewsForRestaurant(restaurantId));
  }

  void onRatingChanged(double newRating) {
    userRating.value = newRating;
  }

  void deleteRestaurant() {
    if (restaurant.value == null) {
      Get.snackbar('ข้อผิดพลาด', 'ไม่สามารถลบ: ไม่พบข้อมูลร้านค้า',
          snackPosition: SnackPosition.TOP);
      return;
    }

    final String restaurantName = restaurant.value!.restaurantName;
    final String currentRestaurantId = restaurant.value!.id;

    Get.defaultDialog(
      title: "ยืนยันการลบ",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("คุณแน่ใจหรือไม่ว่าต้องการลบร้าน\n'$restaurantName'?",
              textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    "ยกเลิก",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    isDeleting.value = true;
                    Get.back();
                    _filterController
                        .removeRestaurantFromList(currentRestaurantId);
                    Get.back();
                    Get.snackbar(
                      'สำเร็จ',
                      'ลบร้านค้า "$restaurantName" เรียบร้อยแล้ว',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 2),
                    );
                    isDeleting.value = false;
                  },
                  child: const Text("ยืนยัน"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
}
