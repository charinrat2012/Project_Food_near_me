import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/slidectrl.dart';
class Slideim extends StatelessWidget {
  Slideim({super.key});
  final SlideController controller = Get.find<SlideController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 120,
        child: Obx(
          () => PageView.builder(
            controller: controller.pageController,
            itemCount: controller.displayPizzaImages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    controller.displayPizzaImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
