import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_near_me_app/controllers/filterctrl.dart';
import 'package:food_near_me_app/controllers/fogotpassctrl.dart';
import 'package:food_near_me_app/controllers/myshopctrl.dart';
import 'package:food_near_me_app/controllers/otpctrl.dart';
import 'package:food_near_me_app/controllers/resctrl.dart';
import 'package:food_near_me_app/controllers/splashctrl.dart';
import 'package:food_near_me_app/model/restaurant.dart';
import 'package:food_near_me_app/views/splash_ui.dart';
import 'package:get/get.dart';
import 'controllers/loginctrl.dart';
import 'controllers/pagectrl.dart';
import 'controllers/registerctrl.dart';
import 'controllers/resetpassctrl.dart';
import 'controllers/reviewctrl.dart';
import 'controllers/scrollctrl.dart';
import 'controllers/slidectrl.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put(LoginController());
  Get.put(FilterController());
  Get.put(MyShopController());
  Get.put(RestaurantController());
  Get.put(MainController());
  Get.put(ReviewController());
  Get.put(SlideController());
  Get.put(ScrollpageController());
  Get.put(RegisterController());
  Get.put(ResetpassController());
  Get.put(OtpCotroller());
  Get.put(SplashContrller());
  Get.put(ForgotpassController());

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
        useMaterial3: true, // แนะนำให้ใช้ Material 3
      ),
      home: const SplashUi(),
    );
  }
}
