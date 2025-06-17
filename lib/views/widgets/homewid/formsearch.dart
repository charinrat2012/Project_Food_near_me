import 'package:flutter/material.dart';

class Formsearch extends StatelessWidget {
  const Formsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8 * 2,), 
  child: Container(
    height: 30,
    
    padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding ภายใน Container
    decoration: BoxDecoration(
      color: Colors.white, // สีพื้นหลังของกล่องค้นหา
      borderRadius: BorderRadius.circular(32.0), // กำหนดความมนของมุม
      boxShadow: [ // เพิ่มเงา
        BoxShadow(
          color: Colors.pink.withValues(alpha: 8* 0.03) ,// สีเงา
          spreadRadius: 2, // การกระจายของเงา
          blurRadius: 5, // ความเบลอของเงา
          offset: Offset(0, 3), // ตำแหน่งเงา (x, y)
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none, // สำคัญ: ต้องเป็น none เพื่อไม่ให้มีเส้นขอบของ TextField มาขัดกับ BoxDecoration
        suffixIcon: Icon(Icons.search, color: Colors.grey[600]),
      ),
    ),
  ),
),
const SizedBox(height: 15),
      ]
    );
  }
}