import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/slidectrl.dart';
import '../../model/bannerslide.dart';


class Slideim extends StatelessWidget {
  Slideim({super.key});

  final SlideController controller = Get.find<SlideController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
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
       
        Obx(() {
          if (controller.originalBannerItems.length < 2) {
            return const SizedBox.shrink();
          }
         
          int actualCurrentPage = controller.currentPage.value;
          if (actualCurrentPage == 0) {
            actualCurrentPage = controller.originalBannerItems.length;
          } else if (actualCurrentPage == controller.displayBannerItems.length - 1) {
            actualCurrentPage = 1;
          }
         
          int indicatorIndex = (actualCurrentPage - 1);

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
          );
        }),
      ],
    );
  }
}