// lib/widgets/slide_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/slidectrl.dart';


class Slideim extends StatelessWidget {
   Slideim({super.key});

    final SlideController controller = Get.put(SlideController());
  @override
  Widget build(BuildContext context) {

    return Container(
    //   decoration: BoxDecoration(
    //    borderRadius: BorderRadius.circular(32.0), // กำหนดความมนของมุม
    // boxShadow: [ // เพิ่มเงา
    //   BoxShadow(
    //     color: Colors.pink.withValues(alpha: 8* 0.03) ,// สีเงา
    //     spreadRadius: 2, // การกระจายของเงา
    //     blurRadius: 5, // ความเบลอของเงา
    //     offset: Offset(0, 3), // ตำแหน่งเงา (x, y)
    //   ),
    // ],
    //   ),
      child: SizedBox(
        
        height: 120, // กำหนดความสูงของสไลด์ตามต้องการ
        child: Obx(() => PageView.builder( // Obx rebuilds when displayPizzaImages changes
          controller: controller.pageController,
          itemCount: controller.displayPizzaImages.length, // ใช้ list ที่ถูกปรับปรุงแล้ว
          onPageChanged: controller.onPageChanged,
          itemBuilder: (BuildContext context, int index) {
            // ไม่ต้องตรวจสอบ index เกินขอบเขตแล้ว เพราะ PageView.builder จะไม่สร้างเกิน itemCount
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                
                child: Image.asset(
                  controller.displayPizzaImages[index], // ใช้ list ที่ถูกปรับปรุงแล้ว
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}