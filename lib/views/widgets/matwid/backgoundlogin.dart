import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'logo.dart';

class Backgoundlogin extends StatelessWidget {
  const Backgoundlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return 
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('./assets/imgs/bgLogin.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 8 * 54),
                BlendMode.darken,
              ),
            ),
          ),

          child: Container(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                 color: Colors.transparent, // ทำให้ BackdropFilter โปร่งใสเพื่อแสดงเนื้อหาข้างใต้
          child: Column( // ใช้ Column เพื่อจัดเรียงเนื้อหา (โลโก้) ภายในพื้นหลัง
            mainAxisAlignment: MainAxisAlignment.end, // จัดให้โลโก้อยู่ด้านล่าง
            children: [
              Logo(width: 300,), // วาง Logo ของคุณไว้ที่นี่
               // เพิ่มระยะห่างจากขอบล่างของหน้าจอ
            ],
          ),
              ),
            ),
          ),
        );
      

  }
}
