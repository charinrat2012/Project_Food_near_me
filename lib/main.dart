import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/views/register_ui.dart';
import 'package:food_near_me_app/views/splash_ui.dart';
import 'package:get/get.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter binding is initialized
  // ล็อกการหมุนหน้าจอให้อยู่ในแนวตั้งเท่านั้น (portrait mode)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // ตั้งค่าให้หน้าจอตั้งขึ้น
    DeviceOrientation.portraitDown, // หรือหน้าจอตั้งคว่ำ
  ]).then((_) {
    // หลังจากตั้งค่า orientation แล้ว ค่อยเรียก runApp
    runApp(const MyApp());
  });
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
      home: (SplashUi()),
    );
  }
} 
