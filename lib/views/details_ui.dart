// lib/views/details_ui.dart
import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/editedetail_ui.dart';
import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/detailctrl.dart';
import '../controllers/editedetailctrl.dart';
import '../controllers/filterctrl.dart';
import '../controllers/loginctrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/matwid/back2_bt.dart';
import '../widgets/matwid/back3_bt.dart';
import '../widgets/matwid/back_bt.dart';
import '../widgets/matwid/dotline.dart';
import '../widgets/matwid/star_rating.dart';
import '../widgets/matwid/statustag.dart';
// import '../models/restaurant_model.dart';
import 'navbar.dart';

class RestaurantDetailPageUi extends StatelessWidget {
  final String restaurantId;
  const RestaurantDetailPageUi({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    final FilterController filterController = Get.find<FilterController>();
    final RestaurantDetailController controller =
        Get.find<RestaurantDetailController>(tag: restaurantId);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Align(alignment: Alignment.centerLeft, child: Back3Bt()),
          toolbarHeight: 8 * 10,
          automaticallyImplyLeading: false,
          actions: [
            Obx(() {
              if (controller.restaurant.value == null) {
                return const SizedBox.shrink();
              }
              final restaurant = controller.restaurant.value!;

              final appBarActions = <Widget>[];
              if (loginController.isLoggedIn.value &&
                  restaurant.ownerId == loginController.userId.value) {
                appBarActions.add(
                  Row(
                    children: [
                      TextButton(
                        // onPressed: () => Get.offAll(
                        onPressed: () {
                          // *** จุดแก้ไขสำคัญ: สร้าง Controllers สำหรับหน้า Edit ที่นี่ ***
                          Get.to(
                            () => EditRestaurantDetailsUi(
                              restaurantId: restaurant.id,
                            ),
                            // ใช้ binding เพื่อสร้าง dependency อย่างถูกต้อง
                            binding: BindingsBuilder(() {
                              // สร้าง Controller สำหรับหน้าแก้ไข (จะถูกลบอัตโนมัติเมื่อหน้านี้ปิดไป)
                              Get.lazyPut(
                                () => EditRestaurantDetailsController(
                                  restaurantId: restaurant.id,
                                ),
                                tag: restaurant.id,
                              );
                              // สร้าง Scroll Controller สำหรับหน้าแก้ไขโดยเฉพาะ
                              Get.lazyPut(
                                () => ScrollpageController(),
                                tag: 'edit_details_scroll_${restaurant.id}',
                              );
                            }),
                          );
                        },
                        child: Text(
                          "แก้ไขร้าน",
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.deleteRestaurant();
                        },
                        child: Text(
                          "ลบร้าน",
                          style: GoogleFonts.kanit(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                appBarActions.add(
                  Image.asset(
                    "assets/imgs/logoHome.png",
                    height: 8 * 10,
                    fit: BoxFit.contain,
                  ),
                );
              }

              return Row(children: appBarActions);
            }),

            const SizedBox(width: 10),
          ],

          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink[200]!, Colors.blue[200]!],
                begin: Alignment.centerLeft,
                transform: GradientRotation(3.0),
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[200]!, Colors.pink[200]!],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() {
                                if (controller.restaurant.value == null) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                final restaurant = controller.restaurant.value!;

                                return SingleChildScrollView(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag:
                                              'restaurant_image_${restaurantId}',
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 0.0,
                                            ),
                                            child: Container(
                                              height: 250,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                      top: Radius.circular(30),
                                                    ),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    restaurant.imageUrl,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Dotline(
                                          gradientColors: LinearGradient(
                                            colors: [
                                              Colors.blue.shade50,
                                              Colors.pink.shade200,
                                            ],
                                          ),
                                          height: 4,
                                          dashWidth: 6,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 0.0,
                                          ),
                                          child: Container(
                                            height: 8 * 7,
                                            color: Colors.pink.shade50,
                                            alignment: Alignment.center,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    restaurant.restaurantName,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                        
                                                    ),
                                                    
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                      ),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Obx(() {
                                                      if (controller
                                                              .restaurant
                                                              .value ==
                                                          null) {
                                                        return const SizedBox.shrink();
                                                      }
                                                      final restaurant =
                                                          controller
                                                              .restaurant
                                                              .value!;

                                                      return IconButton(
                                                        icon: Icon(
                                                          restaurant
                                                                  .isFavorite
                                                                  .value
                                                              ? Icons
                                                                    .bookmark_rounded
                                                              : Icons
                                                                    .bookmark_outline_rounded,
                                                          color:
                                                              restaurant
                                                                  .isFavorite
                                                                  .value
                                                              ? Colors.amber
                                                              : Colors.black,
                                                        ),
                                                        onPressed:
                                                            loginController
                                                                .isLoggedIn
                                                                .value
                                                            ? () {
                                                                // 1. เก็บสถานะ *ก่อน* ที่จะกดปุ่ม
                                                                final bool
                                                                wasFavorite =
                                                                    restaurant
                                                                        .isFavorite
                                                                        .value;

                                                                // 2. สั่งให้ Controller ทำงาน
                                                                filterController
                                                                    .toggleFavorite(
                                                                      restaurant
                                                                          .id,
                                                                    );

                                                                // 3. แสดง Snackbar โดยอิงจากสถานะ *ก่อนหน้า*
                                                                Get.snackbar(
                                                                  'รายการโปรด',
                                                                  !wasFavorite
                                                                      ? 'เพิ่ม ${restaurant.restaurantName} ในรายการโปรดแล้ว'
                                                                      : 'ลบ ${restaurant.restaurantName} ออกจากรายการโปรดแล้ว',
                                                                  snackPosition:
                                                                      SnackPosition
                                                                          .TOP,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .blueGrey,
                                                                  colorText:
                                                                      Colors
                                                                          .white,
                                                                  duration:
                                                                      const Duration(
                                                                        milliseconds:
                                                                            1200,
                                                                      ),
                                                                );
                                                              }
                                                            : () {
                                                                Get.snackbar(
                                                                  'System',
                                                                  'กรุณาเข้าสู่ระบบเพื่อเพิ่มร้านค้าในรายการโปรด',
                                                                  snackPosition:
                                                                      SnackPosition
                                                                          .TOP,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .orange,
                                                                  colorText:
                                                                      Colors
                                                                          .white,
                                                                  duration:
                                                                      const Duration(
                                                                        seconds:
                                                                            2,
                                                                      ),
                                                                );
                                                              },
                                                      );
                                                    }),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        Dotline(
                                          gradientColors: LinearGradient(
                                            colors: [
                                              Colors.blue.shade50,
                                              Colors.pink.shade200,
                                            ],
                                          ),
                                          height: 4,
                                          dashWidth: 6,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                restaurant.details,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              const SizedBox(height: 10.0),
                                              Text(
                                                "เวลาเปิดร้าน: ${restaurant.openingHours}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              const SizedBox(height: 5.0),
                                              Text(
                                                "เบอร์โทร: ${restaurant.phoneNumber}",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              const SizedBox(height: 5.0),
                                              Text(
                                                "พิกัดที่ตั้ง: ${restaurant.location}",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Obx(
                                                () => StatusTag(
                                                  isOpen:
                                                      restaurant.isOpen.value,
                                                  showMotorcycleIcon: restaurant
                                                      .showMotorcycleIcon,
                                                  fontSize: 14,
                                                  iconSize: 32,
                                                  showOpenStatus: false,
                                                ),
                                              ),
                                              const SizedBox(height: 8.0),
                                              Row(
                                                children: [
                                                  StarRating(
                                                    rating: restaurant.rating,
                                                    size: 20,
                                                    onRatingChanged:
                                                        (newRating) {},
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "ประเภท: ${restaurant.type}",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.pink[700],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                "เมนูแนะนำ:",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              const SizedBox(height: 10.0),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    restaurant.menuImage,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                "โปรโมชั่น:",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                    ),
                                                child: Image.asset(
                                                  restaurant.bannerImage,
                                                  height: 8 * 11,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(height: 30.0),
                                              Dotline(
                                                gradientColors: LinearGradient(
                                                  colors: [
                                                    Colors.blue.shade200,
                                                    Colors.pink.shade200,
                                                  ],
                                                ),
                                                height: 4,
                                                dashWidth: 6,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 15.0,
                                                    ),
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
                                                  colors: [
                                                    Colors.blue.shade200,
                                                    Colors.pink.shade200,
                                                  ],
                                                ),
                                                height: 4,
                                                dashWidth: 6,
                                              ),
                                              const SizedBox(height: 20.0),
                                              Container(
                                                height: 300,
                                                width: double.infinity,
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.pink.shade50,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                ),
                                                child: Obx(() {
                                                  if (controller
                                                      .reviews
                                                      .isEmpty) {
                                                    return const Text(
                                                      "ยังไม่มีรีวิวสำหรับร้านนี้",
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    );
                                                  } else {
                                                    return ListView.builder(
                                                      itemCount: controller
                                                          .reviews
                                                          .length,
                                                      itemBuilder: (context, index) {
                                                        final review =
                                                            controller
                                                                .reviews[index];
                                                        return Card(
                                                          margin:
                                                              const EdgeInsets.only(
                                                                bottom: 15.0,
                                                              ),
                                                          elevation: 2,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  12.0,
                                                                ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child: Text(
                                                                        review['user'],
                                                                        style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    StarRating(
                                                                      rating:
                                                                          review['rating'],
                                                                      size: 16,
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Text(
                                                                  review['comment'],
                                                                  style:
                                                                      const TextStyle(
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
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
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    Obx(
                                                      () => StarRating(
                                                        rating: controller
                                                            .userRating
                                                            .value,
                                                        size: 24,
                                                        onRatingChanged:
                                                            controller
                                                                .onRatingChanged,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 15.0),
                                              TextField(
                                                controller: controller
                                                    .commentController,
                                                maxLines: 4,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      "เขียนความคิดเห็นของคุณที่นี่...",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.0,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10.0,
                                                            ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .pink
                                                              .shade400,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                        15.0,
                                                      ),
                                                ),
                                              ),
                                              const SizedBox(height: 20.0),
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed:
                                                      controller.submitReview,
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.pink[400],
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 40,
                                                          vertical: 15,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            30.0,
                                                          ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "ส่งรีวิว",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
