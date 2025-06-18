import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/controllers/splashctrl.dart';
import 'package:food_near_me_app/views/widgets/matwid/loadingcircle.dart';
import 'package:get/get.dart';

import 'widgets/matwid/backgoundsplash.dart';


class SplashUi extends StatelessWidget {
  const SplashUi({super.key});

  @override
  Widget build(BuildContext context) {
   final SplashContrller counterController = Get.find<SplashContrller>();

    return Scaffold( // <--- Scaffold หลักเพียงตัวเดียว
      backgroundColor: Colors.transparent, // ตั้งค่าสีพื้นหลัง หรือสีที่คุณต้องการ
      body: Stack( // <--- ใช้ Stack เป็น body ของ Scaffold
        children: [
          Positioned.fill(child: Backgoundsplash()), // พื้นหลังเต็มหน้าจอ
          Center( // วาง LoadingCircle ไว้ตรงกลาง
            child: LoadingCircle(),
          ),
        ],
      ),
    );
  }
}