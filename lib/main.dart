import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_near_me_app/controllers/restaurant_detail_ctrl.dart';
import 'package:food_near_me_app/controllers/restaurant_edit_detail_ctrl.dart';
import 'package:food_near_me_app/controllers/profile_edit_ctrl.dart';
import 'package:food_near_me_app/controllers/filte_rctrl.dart';
import 'package:food_near_me_app/controllers/fogot_password_ctrl.dart';
import 'package:food_near_me_app/controllers/myshop_ctrl.dart';
import 'package:food_near_me_app/controllers/otp_ctrl.dart';

import 'package:food_near_me_app/controllers/splashctrl.dart';
import 'package:food_near_me_app/model/restaurant.dart';
import 'package:food_near_me_app/views/splash_ui.dart';
import 'package:get/get.dart';
import 'controllers/login_ctrl.dart';
import 'controllers/page_navbar_ctrl.dart';
import 'controllers/register_ctrl.dart';
import 'controllers/reset_password_ctrl.dart';
import 'controllers/review_ctrl.dart';
import 'controllers/scrollctrl.dart';
import 'controllers/slidectrl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put(LoginController());
  Get.put(ForgotPasswordController());
  Get.put(ResetPasswordController());

  Get.put(FilterController());
  Get.put(EditProfileController());

  Get.put(ScrollpageController(), tag: 'home_scroll');
  Get.put(ScrollpageController(), tag: 'favorite_scroll');
  Get.put(ScrollpageController(), tag: 'myshop_scroll');
  Get.put(ScrollpageController(), tag: 'detail_scroll');
  Get.put(ScrollpageController(), tag: 'editdetail_scroll');
  Get.put(ScrollpageController(), tag: 'editprofile_scroll');

  Get.put(MyShopController());


  Get.put(PageNavbarController());
  Get.put(ReviewController());
  Get.put(SlideController());

  Get.put(RegisterController());
  Get.put(OtpController());
  Get.put(SplashContrller());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashUi(),
    );
  }
}
