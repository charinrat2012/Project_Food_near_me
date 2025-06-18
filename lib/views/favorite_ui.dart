import 'package:flutter/material.dart';

class FavoriteUi extends StatelessWidget {
  const FavoriteUi({super.key});

  @override
  Widget build(BuildContext context) {
    // <--- ลบ Scaffold ออกไปเลย
    return Center( // คุณสามารถใช้ Column, ListView, SingleChildScrollView หรือ Stack แทนได้ ขึ้นอยู่กับเนื้อหาของคุณ
      child: Column( // ตัวอย่าง: ใช้ Column เป็นเนื้อหาหลัก
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.favorite, size: 100, color: Colors.red),
          SizedBox(height: 20),
          Text('ดูรายการโปรดของคุณที่นี่', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}