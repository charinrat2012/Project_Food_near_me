// lib/views/home_ui.dart

import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/details_ui.dart';
import 'package:food_near_me_app/views/widgets/homewid/LocationFilterBar.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/views/widgets/homewid/formsearch.dart';
import 'package:food_near_me_app/views/widgets/homewid/item.dart'; // RestaurantCard
import 'package:food_near_me_app/views/widgets/homewid/slideim.dart'; // ตรวจสอบ path
import 'package:food_near_me_app/views/login_ui.dart';

// ไม่ต้อง import controllers/scrollctrl.dart และ controllers/slide_controller.dart ตรงๆ ที่นี่อีกต่อไป
// เพราะเราจะ Get.find() จากสิ่งที่ถูก Get.put() ใน MainController แล้ว
import 'package:food_near_me_app/views/controllers/scrollctrl.dart'; // ยังคงต้อง import เพื่อให้รู้จัก ScrollpageController
// import 'package:food_near_me_app/views/controllers/slide_controller.dart'; // ไม่จำเป็นต้อง import ถ้า Slideim จัดการเอง

import 'widgets/matwid/scrolltotop_bt.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  static final List<Map<String, dynamic>> restaurantList = [
    {
      'imageUrl': 'assets/imgs/pama.png',
      'restaurantName': 'Pasta AMA',
      'description':
          'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details':
          '         Pasta AMA เป็นร้านอาหารอิตาเลียนที่เชี่ยวชาญด้านพาสต้าสดใหม่ ด้วยวัตถุดิบคุณภาพสูงและสูตรต้นตำรับ เมนูเด่นคือคาโบนาร่าที่เข้มข้น และเพสโต้ที่หอมกลิ่นใบโหระพาแท้ๆ บรรยากาศอบอุ่นเหมาะกับการมาทานกับครอบครัวหรือเพื่อนฝูง',
      'openingHours':
          "จันทร์ - พฤหัสบดี 10:00 - 21:00\nศุกร์ - เสาร์ 10:00 - 22:00\nอาทิตย์ 10:00 - 21:00",
      'phoneNumber': "02-123-4567",
      'location': "กรุงเทพมหานคร สุขุมวิท 39 (หน้าโครงการ The Opus ทองหล่อ 10)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'imageUrl': 'assets/imgs/im1.jpg',
      'restaurantName': 'UMENOHANA นิฮอนมูระมอลล์',
      'description':
          'ร้านนี้โดดเด่นที่เมนูเต้าหู้ มาแล้วต้องลองกับฟองเต้าหู้สดที่เราต้มเองกับมือ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          '         UMENOHANA นำเสนอประสบการณ์อาหารญี่ปุ่นแบบไคเซกิ โดยเน้นเมนูที่ทำจากเต้าหู้หลากหลายรูปแบบ ไม่ว่าจะเป็นเต้าหู้สดที่ทำเอง, เต้าหู้ทอดกรอบ, หรือเต้าหู้ในซุปใส บรรยากาศเงียบสงบสไตล์ญี่ปุ่นแท้ๆ เหมาะสำหรับผู้ที่ชื่นชอบอาหารเพื่อสุขภาพและรสชาติละเอียดอ่อน',
      'openingHours':
          "จันทร์ - ศุกร์ 11:00 - 22:00\nเสาร์ - อาทิตย์ 10:00 - 23:00",
      'phoneNumber': "02-987-6543",
      'location': "นิฮอนมูระมอลล์ ทองหล่อ 13",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'imageUrl': 'assets/imgs/im2.jpg',
      'restaurantName': 'Simple Day Gelato',
      'description':
          'ร้านเล็กๆสำหรับคนรักขนมหวานที่เรานำทุกเมนูโปรด ชนิดที่เรียกว่าเป็นขนมที่ต้องมีติดบ้านไว้เสมอ   รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 1.5,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          '         เป็นร้านขนมหวานรสชาตินุ่มละมุนที่ครองใจลูกค้าเป็นอย่างดี โดยมีเมนูของหวานอร่อยให้เลือกหลากหลายเมนู อาทิ Shibuya Honey Toast, เค้กช็อกโกแลต เครื่องดื่มสดชื่น บรรยากาศดี',
      'openingHours': "ทุกวัน 10:30 - 21:30",
      'phoneNumber': "000-0000-000",
      'location':
          "ชั้น G หน้าบิ๊กซีใหญ่ บางแคเหนือ บางแค กรุงเทพมหานคร (เดอะมอลล์บางแค)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'imageUrl': 'assets/imgs/im3.jpg',
      'restaurantName': 'มิตรโกหย่วน',
      'description':
          ' ร้านอาหารตามสั่ง เจ้าเด็ดที่ต่อมา เราขอพาทุกคนไปอิ่มกับร้าน มิตรโกหย่วน แถวย่านย่านเสาชิงช้า รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 0.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          '         มิตรโกหย่วน คือร้านอาหารตามสั่งเก่าแก่ที่ขึ้นชื่อเรื่องความอร่อยแบบไทยแท้ๆ ทุกจานปรุงสดใหม่ด้วยวัตถุดิบคุณภาพ เมนูที่พลาดไม่ได้คือข้าวผัดกะเพราและแกงเขียวหวานรสจัดจ้าน เหมาะสำหรับมื้อกลางวันที่ต้องการความอิ่มอร่อยและคุ้มค่า',
      'openingHours': "จันทร์ - ศุกร์ 09:00 - 18:00\nเสาร์ - อาทิตย์ หยุด",
      'phoneNumber': "081-234-5678",
      'location':
          "ถนนดินสอ แขวงบวรนิเวศ เขตพระนคร กรุงเทพมหานคร (ใกล้ศาลาว่าการกรุงเทพมหานคร)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'imageUrl': 'assets/imgs/im4.jpg',
      'restaurantName': 'ส้มตำหม่องปลาแดก',
      'description':
          'ร้านส้มตำที่ขึ้นชื่อเรื่องความจัดจ้านแบบไม่เป็นสองรองใครในย่านลาดกระบัง สารพัดเมนูตำแซ่บๆ มาเพียบ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': false,
      'showMotorcycleIcon': true,
      'details':
          '         ส้มตำหม่องปลาแดก เป็นสวรรค์ของคนรักส้มตำปลาร้า ด้วยรสชาติที่จัดจ้านถึงใจและวัตถุดิบสดใหม่ เมนูหลากหลายตั้งแต่ส้มตำปูปลาร้า ไปจนถึงตำถาดรสแซ่บเผ็ดร้อน บรรยากาศร้านเป็นกันเอง เหมาะกับการมาสังสรรค์กับเพื่อนๆ',
      'openingHours': "ทุกวัน 11:00 - 21:00",
      'phoneNumber': "098-765-4321",
      'location': "ลาดกระบัง ซอย 13 กรุงเทพมหานคร",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'imageUrl': 'assets/imgs/im5.jpg',
      'restaurantName': 'เหมยหมึกเป็นซาชิมิ',
      'description':
          'ร้านของเราคือการคัดสรรวัตถุดิบคุณภาพ เมนูอาหารทะเลที่หลากหลายกว่า 200 เมนู ไม่ต้องไปไกลถึงทะเล ร้านเราก็มีขาย! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 0.1,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          '         เหมยหมึกเป็นซาชิมิ ร้านอาหารทะเลสดๆ ที่นำเสนอเมนูปลาหมึกเป็นซาชิมิที่หาทานยาก พร้อมอาหารทะเลอื่นๆ อีกกว่า 200 เมนู เช่น กุ้งเผา, ปูผัดผงกะหรี่ และหอยเชลล์อบเนย การันตีความสดใหม่เหมือนยกทะเลมาไว้ที่ร้าน',
      'openingHours': "ทุกวัน 12:00 - 23:00",
      'phoneNumber': "080-111-2222",
      'location': "ถนนพระราม 9 กรุงเทพมหานคร (ใกล้แยกผังเมือง)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // เปลี่ยน Get.put() เป็น Get.find() เพื่อดึง Controller ที่ถูกสร้างใน MainController แล้ว
    final ScrollpageController scrollpageController = Get.find<ScrollpageController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "assets/imgs/logoHome.png",
              height: 8 * 10,
              fit: BoxFit.contain,
            ),
          ),
          toolbarHeight: 8 * 12,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).push(MaterialPageRoute(builder: (context) => LoginUi()));
              },
              child: const Text(
                "ล็อคอิน",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        controller: scrollpageController.scrollController, // ใช้ controller ที่ถูก find แล้ว
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Formsearch(),
                            const LocationFilterBar(),

                            // แสดงรูปภาพโปรโมชั่น
                            const SizedBox(height: 8),
                            Slideim(), // Slideim จะไป Get.find() SlideController
                            const SizedBox(height: 8),
                            ...restaurantList.map((restaurantData) {
                              return RestaurantCard(
                                imageUrl: restaurantData['imageUrl']!,
                                restaurantName:
                                    restaurantData['restaurantName']!,
                                description: restaurantData['description']!,
                                rating: restaurantData['rating']!,
                                isOpen: restaurantData['isOpen']!,
                                showMotorcycleIcon:
                                    restaurantData['showMotorcycleIcon']!,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RestaurantDetailPageUi(
                                        restaurantName:
                                            restaurantData['restaurantName']!,
                                        imageUrl: restaurantData['imageUrl']!,
                                        description:
                                            restaurantData['description']!,
                                        rating: restaurantData['rating']!,
                                        isOpen: restaurantData['isOpen']!,
                                        showMotorcycleIcon:
                                            restaurantData['showMotorcycleIcon']!,
                                        details: restaurantData['details']!,
                                        openingHours:
                                            restaurantData['openingHours']!,
                                        phoneNumber:
                                            restaurantData['phoneNumber']!,
                                        location: restaurantData['location']!,
                                        menuimage: restaurantData['menuimage']!,
                                        bannerImage:
                                            restaurantData['bannerImage']!,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => scrollpageController.showScrollToTopButton.value // ใช้ scrollpageController
                  ? Positioned(
                      right: 20.0,
                      bottom: MediaQuery.of(context).padding.bottom + 16.0,
                      child: ScrollToTopButton(
                        onPressed: scrollpageController.scrollToTop,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}