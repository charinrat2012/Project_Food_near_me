import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_near_me_app/views/splash_ui.dart';
import 'package:get/get.dart';

import 'views/controllers/pagectrl.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ล็อกการหมุนหน้าจอ
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.put(MainController());

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
      ),
      home: (SplashUi()), //DetailsUi
    );
  }
}