import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/slidectrl.dart';
import '../../model/bannerslide.dart';


class Slideim extends StatelessWidget {
  Slideim({super.key});

  final SlideController controller = Get.find<SlideController>();

  @override
  Widget build(BuildContext context) {
    return Column( // <--- เปลี่ยนจาก Container เป็น Column เพื่อรองรับ Page Indicator
      children: [
        SizedBox(
          height: 120, // ความสูงของสไลด์
          child: Obx(
            () => PageView.builder(
              controller: controller.pageController,
              itemCount: controller.displayBannerItems.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (BuildContext context, int index) {
                final BannerItem bannerItem = controller.displayBannerItems[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: GestureDetector(
                      onTap: () {
                        // เรียกเมธอดนำทางใน Controller เมื่อมีการแตะ
                        controller.navigateToRestaurantDetail(bannerItem.restaurantId);
                      },
                      child: Image.asset(
                        bannerItem.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        // Page Indicator
        Obx(() {
          if (controller.originalBannerItems.length < 2) {
            return const SizedBox.shrink(); // ซ่อน indicator ถ้ามีรูปไม่พอสำหรับ looping
          }
          // คำนวณ index จริงสำหรับ indicator (ไม่นับรูปปลอมสำหรับ loop)
          int actualCurrentPage = controller.currentPage.value;
          if (actualCurrentPage == 0) { // ถ้าอยู่หน้าปลอมแรก (รูปสุดท้ายจริง)
            actualCurrentPage = controller.originalBannerItems.length;
          } else if (actualCurrentPage == controller.displayBannerItems.length - 1) { // ถ้าอยู่หน้าปลอมสุดท้าย (รูปแรกจริง)
            actualCurrentPage = 1;
          }
          // ปรับเป็น 0-based index สำหรับ Map.entries เพื่อให้ตรงกับ originalBannerItems
          int indicatorIndex = (actualCurrentPage - 1); // ลบ 1 เพราะ originalBannerItems เป็น 0-based

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
          );
        }),
      ],
    );
  }
}