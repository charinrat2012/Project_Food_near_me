import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_near_me_app/views/controllers/fogotpassctrl.dart';
import 'package:food_near_me_app/views/controllers/otpctrl.dart';
import 'package:food_near_me_app/views/controllers/splashctrl.dart';
import 'package:food_near_me_app/views/splash_ui.dart';
import 'package:get/get.dart';
import 'views/controllers/loginctrl.dart';
import 'views/controllers/pagectrl.dart';
import 'views/controllers/registerctrl.dart';
import 'views/controllers/resetpassctrl.dart';
import 'views/controllers/reviewctrl.dart';
import 'views/controllers/scrollctrl.dart';
import 'views/controllers/slidectrl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put(MainController());
  Get.put(ReviewController());
  Get.put(SlideController());
  Get.put(ScrollpageController());
  Get.put(LoginController());
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
