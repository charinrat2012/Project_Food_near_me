// lib/widgets/detailswid/banner.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detail_menu_ctrl.dart'; // สำหรับ DynamicImage

class Promotion extends StatelessWidget {
  const Promotion({super.key, required this.promotion});

  final List<String> promotion;

  @override
  Widget build(BuildContext context) {
    if (promotion.isEmpty) {
      return _buildEmptyState();
    }

    // --- 1. ตรวจสอบว่าข้อมูลเป็นรูปภาพหรือข้อความ ---
    // (ถ้ามี item ไหนที่ดูเหมือน path รูปภาพ, ให้ถือว่าเป็นรูปภาพทั้งหมด)
    bool isImageBanner = promotion.any((item) =>
        item.startsWith('assets/') ||
        item.contains('.jpg') ||
        item.contains('.jpeg') ||
        item.contains('.png'));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "โปรโมชั่น:",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 10),

        // --- 2. เลือก Widget ที่จะแสดงผลตามประเภท ---
        isImageBanner ? _buildImageBanners() : _buildTextBanners(),
      ],
    );
  }

  // Widget แสดงผลเมื่อไม่มีข้อมูล
  Widget _buildEmptyState() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
            "โปรโมชั่น:",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
            ),
            ),
            const SizedBox(height: 10),
            Center(
                child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                    "ไม่มีโปรโมชั่นในขณะนี้",
                    style: GoogleFonts.kanit(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    ),
                ),
                ),
            )
        ],
    );
  }

  // Widget แสดงผลโปรโมชั่นแบบ "รูปภาพ" (เหมือนเดิม)
  Widget _buildImageBanners() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: promotion.length,
        itemBuilder: (context, index) {
          final imageUrl = promotion[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: 300,
                child: DetailMenuCtrl(imageUrl: imageUrl),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- 3. Widget ใหม่! สำหรับแสดงผลโปรโมชั่นแบบ "ข้อความ" ---
  Widget _buildTextBanners() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.pink.shade100, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: promotion.map((text) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '• $text', // เพิ่ม bullet point ด้านหน้า
              style: GoogleFonts.kanit(fontSize: 14.0, color: Colors.black87),
            ),
          );
        }).toList(),
      ),
    );
  }
}