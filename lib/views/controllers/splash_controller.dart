import 'package:food_near_me_app/views/home_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/views/register_ui.dart';
import 'package:get/get.dart';






class SplashContrller extends GetxController{
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => HomeUi());
    });
  }
}