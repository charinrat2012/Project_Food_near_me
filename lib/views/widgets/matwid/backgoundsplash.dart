import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'logo.dart';

class Backgoundsplash extends StatelessWidget {
  const Backgoundsplash({super.key});

  @override
  Widget build(BuildContext context) {
    return 
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('./assets/imgs/bgLogin.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 8 * 50),
                BlendMode.darken,
              ),
            ),
          ),

          child: Container(
            // child: BackdropFilter(
            //   filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                //  color: Colors.transparent, // ทำให้ BackdropFilter โปร่งใสเพื่อแสดงเนื้อหาข้างใต้
          child: Column( // ใช้ Column เพื่อจัดเรียงเนื้อหา (โลโก้) ภายในพื้นหลัง
            mainAxisAlignment: MainAxisAlignment.start, // จัดให้โลโก้อยู่ด้านล่าง
            children: [
              SizedBox(height: 8 * 1), // เพิ่มระยะห่างจากขอบล่างของหน้าจอ
              Logo(width: 350,), // วาง Logo ของคุณไว้ที่นี่
            ],
          ),
              ),
            // ),
          ),
        );
      

  }
}
