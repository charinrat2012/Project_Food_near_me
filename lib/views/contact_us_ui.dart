// lib/screens/contact_us_ui.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/matwid/back_bt.dart'; // ตรวจสอบเส้นทางให้ถูกต้อง
import 'setting_ui.dart'; // เพื่อกลับไปหน้า SettingUi

class ContactUsUi extends StatelessWidget {
  const ContactUsUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackBt(srcp: () => SettingUi()), // กลับไปหน้า SettingUi
        title: const Text('ติดต่อเรา'),
        backgroundColor: Colors.blue[200],
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        toolbarHeight: 8 * 9,
      ),
      body: Container(
          color: Colors.white,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.pink[300]!,
        //       Colors.purple[100]!,
        //       Colors.blue[200]!,
        //     ],
        //     begin: Alignment.topCenter,
        //     transform: const GradientRotation(3.0),
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'ติดต่อแอปพลิเคชัน "ร้านอาหารใกล้ฉัน"',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'เรายินดีรับฟังทุกความคิดเห็น คำถาม หรือข้อเสนอแนะจากคุณ เพื่อนำไปปรับปรุงและพัฒนาบริการของแอปพลิเคชัน "ร้านอาหารใกล้ฉัน" ให้ดียิ่งขึ้น คุณสามารถติดต่อเราได้ตามช่องทางด้านล่างนี้:',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 24),

              Text(
                'ข้อมูลการติดต่อ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(
                '- **อีเมล:** support@foodnearmeapp.com',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Text(
                '- **โทรศัพท์:** +66 (0) 123 4567 (เวลาทำการ: จันทร์-ศุกร์, 09:00 - 17:00 น.)',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Text(
                '- **ที่อยู่:** เลขที่ 123 อาคารแอปพลิเคชัน แขวง/เขต บางกอกน้อย กรุงเทพมหานคร 10700',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 24),

              Text(
                'ช่องทางโซเชียลมีเดีย',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(
                'ติดตามข่าวสารและโปรโมชั่นพิเศษจากเราได้ที่:',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Text(
                '- **Facebook:** facebook.com/FoodNearMeApp',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Text(
                '- **Instagram:** instagram.com/FoodNearMeApp',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Text(
                '- **X (Twitter):** twitter.com/FoodNearMeApp',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 24),

              Text(
                'แบบฟอร์มติดต่อ (สำหรับข้อเสนอแนะ)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(
                'หากคุณต้องการส่งข้อเสนอแนะโดยตรงผ่านแอปพลิเคชัน โปรดกรอกข้อมูลในแบบฟอร์มด้านล่างนี้ (คุณสมบัตินี้จะถูกพัฒนาในอนาคต):',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 16),
              // สามารถเพิ่ม TextFormFields สำหรับชื่อ, อีเมล, ข้อความได้ในอนาคต
              // เช่น:
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'ชื่อของคุณ',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 8),
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'อีเมล',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 8),
              // TextField(
              //   maxLines: 5,
              //   decoration: InputDecoration(
              //     labelText: 'ข้อความ/ข้อเสนอแนะ',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () {
              //     // ส่งข้อมูล
              //     Get.snackbar('ส่งสำเร็จ', 'ขอบคุณสำหรับข้อเสนอแนะของคุณ!');
              //   },
              //   child: Text('ส่งข้อความ'),
              // ),
              SizedBox(height: 24),
              Text(
                'เราจะตอบกลับข้อความของคุณโดยเร็วที่สุดเท่าที่จะทำได้',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}