import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantCard extends StatelessWidget {
  final String imageUrl; // URL หรือ Asset Path ของรูปภาพร้าน
  final String restaurantName;
  final String description;
  final double rating; // คะแนนรีวิว (1-5)
  final bool isOpen; // true ถ้าเปิด, false ถ้าปิด
  final bool showMotorcycleIcon; // true ถ้าต้องการแสดงไอคอนหมวกกันน็อก

  const RestaurantCard({
    Key? key,
    required this.imageUrl,
    required this.restaurantName,
    required this.description,
    this.rating = 0.0, // ค่าเริ่มต้น 0 ดาว
    this.isOpen = false, // ค่าเริ่มต้นคือปิด
    this.showMotorcycleIcon = false, // ค่าเริ่มต้นคือไม่แสดง
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0), // ระยะห่างระหว่าง Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // มุมโค้งมนของ Card
      ),
      elevation: 3, // เงาของ Card
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Padding ภายใน Card
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // จัดวาง Widget ลูกชิดบน
          children: [
            // ส่วนรูปภาพร้านค้า
            Container(
              width: 50, // กำหนดความกว้างรูปภาพ
              height: 50, // กำหนดความสูงรูปภาพ
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // มุมโค้งมนของรูปภาพ
                image: DecorationImage(
                  image: AssetImage(imageUrl), // ใช้ AssetImage สำหรับรูปจาก assets
                  // หรือ NetworkImage(imageUrl) ถ้าเป็นรูปจาก URL
                  fit: BoxFit.cover, // ให้รูปภาพครอบคลุมพื้นที่
                ),
              ),
            ),
            const SizedBox(width: 12.0), // ระยะห่างระหว่างรูปกับข้อความ

            // ส่วนข้อมูลร้านค้า
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความชิดซ้าย
                children: [
                  Text(
                    restaurantName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // สีชื่อร้าน
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[700], // สีรายละเอียด
                    ),
                    maxLines: 3, // จำกัดจำนวนบรรทัด
                    overflow: TextOverflow.ellipsis, // ถ้าเกินให้แสดง ...
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // จัดรีวิวกับสถานะให้คนละฝั่ง
                    children: [
                      // ส่วนคะแนนรีวิว
                      _buildStarRating(rating),
                      // ส่วนสถานะร้านค้า (OPEN/CLOSE)
                      _buildStatusWidget(isOpen, showMotorcycleIcon),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget สำหรับแสดงดาวคะแนน
  Widget _buildStarRating(double rating) { // <--- รับค่า rating เป็น double
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          // ถ้า index น้อยกว่าส่วนจำนวนเต็มของ rating ให้แสดงดาวเต็ม
          return const Icon(
            Icons.star,
            color: Colors.pink,
            size: 10,
          );
        } else if (index == rating.floor() && (rating % 1 != 0)) {
          // ถ้า index ตรงกับส่วนจำนวนเต็ม และมีทศนิยม (คือมีครึ่งดาว)
          return const Icon(
            Icons.star_half,
            color: Colors.pink,
            size: 10,
          );
        } else {
          // ที่เหลือแสดงดาวขอบ
          return const Icon(
            Icons.star_border,
            color: Colors.pink,
            size: 10,
          );
        }
      }),
    );
  }

  // Widget สำหรับแสดงสถานะร้าน (OPEN/CLOSE และไอคอนหมวกกันน็อก)
  Widget _buildStatusWidget(bool isOpen, bool showMotorcycleIcon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showMotorcycleIcon && isOpen) // แสดงไอคอนหมวกกันน็อกเฉพาะตอนเปิด
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.two_wheeler, // ไอคอนหมวกกันน็อก
              size: 10,
              color: Colors.black, // สีไอคอนหมวกกันน็อก
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: isOpen
                ? const Color.fromARGB(255, 255, 204, 229) // สีพื้นหลัง OPEN (ชมพูอ่อน)
                : const Color.fromARGB(255, 255, 204, 229), // สีพื้นหลัง CLOSE (ชมพูอ่อน)
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: isOpen
                  ? const Color.fromARGB(255, 255, 153, 204) // สีขอบ OPEN (ชมพูเข้ม)
                  : const Color.fromARGB(255, 255, 153, 204), // สีขอบ CLOSE (ชมพูเข้ม)
              width: 1.0,
            ),
          ),
          child: Text(
            isOpen ? 'OPEN' : 'CLOSE',
            style: GoogleFonts.nosifer(
              color: isOpen
                  ? const Color.fromARGB(255, 255, 255, 255) // สีตัวอักษร OPEN (ชมพูเข้ม)
                  : const Color.fromARGB(255, 255, 255, 255), // สีตัวอักษร CLOSE (ชมพูเข้ม)
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
