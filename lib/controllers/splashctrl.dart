import 'package:get/get.dart';

import '../views/navbar.dart';

class SplashContrller extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => Navbar());
    });
  }
}
