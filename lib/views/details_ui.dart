import 'package:flutter/material.dart';

import 'widgets/detailswtd/dashed_line.dart'; // ตรวจสอบเส้นทางไฟล์นี้ให้ถูกต้อง

class DetailsUi extends StatelessWidget {
  const DetailsUi({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],

        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          elevation: 0,
          toolbarHeight: 100.0,

          // ปุ่มลูกศรย้อนกลับด้านซ้าย
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          title: Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 15.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "assets/imgs/logoHome.png",
                height: 8 * 10,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        body: Column(
          children: [
            // ตำแหน่งสำหรับ DashedLine()
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: DashedLine(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                // *** เริ่มต้นการเปลี่ยนแปลงหลักที่นี่ ***
                child: SingleChildScrollView( // ใช้ SingleChildScrollView หากเนื้อหาอาจล้นจอ
                  child: Padding(
                    padding: const EdgeInsets.all(20.0), // เพิ่ม Padding โดยรวมสำหรับเนื้อหาภายใน Container สีขาว
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความให้อยู่ชิดซ้าย
                      children: [
                        
                        // รายละเอียดร้านค้า
                        Text(
                          "เป็นร้านขนมหวานรสชาตินุ่มละมุนที่ครองใจลูกค้าเป็นอย่างดี "
                          "โดยมีเมนูของหวานอร่อยให้เลือกหลากหลายเมนู อาทิ Shibuya Honey "
                          "Toast, เค้กช็อกโกแลต เครื่องดื่มสดชื่น บรรยากาศดี",
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 10.0), // เว้นวรรค

                        // เวลาเปิดร้าน
                        Text(
                          "เวลาเปิดร้าน",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        Text(
                          "จันทร์ - พฤหัสบดี 10:00 - 21:00\n"
                          "ศุกร์ - เสาร์ 10:00 - 22:00\n"
                          "อาทิตย์ 10:00 - 21:00",
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 10.0),

                        // เบอร์โทร
                        Text(
                          "เบอร์โทร : 000-0000-000",
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 10.0),

                        // พิกัดที่ตั้ง
                        Text(
                          "พิกัดที่ตั้ง : ชั้น G หน้าบิ๊กซีใหญ่ บางแคเหนือ บางแค กรุงเทพมหานคร "
                          "กรุงเทพมหานคร (เดอะมอลล์บางแค)",
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 15.0),

                        // ดาวให้คะแนน
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, // จัดดาวให้อยู่กึ่งกลาง
                          children: const [
                            Icon(Icons.star, color: Colors.red, size: 30),
                            Icon(Icons.star, color: Colors.red, size: 30),
                            Icon(Icons.star, color: Colors.red, size: 30),
                            Icon(Icons.star, color: Colors.red, size: 30),
                            Icon(Icons.star_border, color: Colors.red, size: 30), // ดาวที่ไม่ถูกเติมสี
                          ],
                        ),
                        const SizedBox(height: 20.0),

                        // หัวข้อ "เมนู:"
                        Text(
                          "เมนู:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(height: 10.0), // เว้นวรรคระหว่างหัวข้อกับรูปเมนู

                        // รูปเมนู
                        // Center( // ใช้ Center เพื่อให้รูปอยู่กึ่งกลางแนวนอน
                        //   child: Image.asset(
                        //     "assets/imgs/im6.png",
                        //     height: 26 * 10, // ใช้ 26 * 10 ตามที่คุณตั้งค่าล่าสุด
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                // *** สิ้นสุดการเปลี่ยนแปลงหลัก ***
              ),
            ),
          ],
        ),
      ),
    );
  }
}