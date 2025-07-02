import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/splashctrl.dart';
import 'package:food_near_me_app/widgets/material_widget/loadingcircle.dart';
import 'package:get/get.dart';
import '../widgets/material_widget/backgoundsplash.dart';

class SplashUi extends StatelessWidget {
  const SplashUi({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashContrller counterController = Get.find<SplashContrller>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(child: Backgoundsplash()),
          Center(child: LoadingCircle()),
        ],
      ),
    );
  }
}
