import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_near_me_app/controllers/detailctrl.dart';
import 'package:food_near_me_app/controllers/editedetailctrl.dart';
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
  Get.put(ForgotpassController());
  Get.put(ResetpassController());
  
  

  Get.put(FilterController());

  Get.put(ScrollpageController(), tag: 'home_scroll');
  Get.put(ScrollpageController(), tag: 'favorite_scroll');
  Get.put(ScrollpageController(), tag: 'myshop_scroll');
  Get.put(ScrollpageController(), tag: 'detail_scroll');
  Get.put(ScrollpageController(), tag: 'editdetail_scroll');
  Get.put(ScrollpageController(), tag: 'editprofile_scroll');

  
  Get.put(MyShopController());
  Get.put(RestaurantController());

  
  Get.put(MainController());
  Get.put(ReviewController());
  Get.put(SlideController());
  
  Get.put(RegisterController());
  Get.put(OtpCotroller());
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
