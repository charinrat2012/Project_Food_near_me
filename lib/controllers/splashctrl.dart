import 'package:get/get.dart';

import '../views/navbar_ui.dart';

class SplashContrller extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => Navbar());
    });
  }
}
