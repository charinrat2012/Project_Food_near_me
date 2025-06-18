import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/details_ui.dart';
import 'package:food_near_me_app/views/widgets/homewid/LocationFilterBar.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/views/widgets/homewid/formsearch.dart';
import 'package:food_near_me_app/views/widgets/homewid/item.dart'; // ใช้ RestaurantCard ตามที่คุณต้องการ
import 'package:food_near_me_app/views/widgets/homewid/slideim.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/views/controllers/scrollctrl.dart';
import 'controllers/detailctrl.dart';
import 'widgets/matwid/scrolltotop_bt.dart';
class HomeUi extends StatelessWidget {
  const HomeUi({super.key});
  static final List<Map<String, dynamic>> restaurantList = [
    // ตรวจสอบข้อมูลใน List นี้ให้แน่ใจว่ามีคีย์ครบถ้วนและไม่มีค่าเป็น null
    {
      'id': 'pasta_ama_001',
      'imageUrl': 'assets/imgs/pama.png',
      'restaurantName': 'Pasta AMA',
      'description':
          'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details':
          ' Pasta AMA เป็นร้านอาหารอิตาเลียนที่เชี่ยวชาญด้านพาสต้าสดใหม่ ด้วยวัตถุดิบคุณภาพสูงและสูตรต้นตำรับ เมนูเด่นคือคาโบนาร่าที่เข้มข้น และเพสโต้ที่หอมกลิ่นใบโหระพาแท้ๆ บรรยากาศอบอุ่นเหมาะกับการมาทานกับครอบครัวหรือเพื่อนฝูง',
      'openingHours':
          "จันทร์ - พฤหัสบดี 10:00 - 21:00\nศุกร์ - เสาร์ 10:00 - 22:00\nอาทิตย์ 10:00 - 21:00",
      'phoneNumber': "02-123-4567",
      'location': "กรุงเทพมหานคร สุขุมวิท 39 (หน้าโครงการ The Opus ทองหล่อ 10)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'id': 'umenohana_002',
      'imageUrl': 'assets/imgs/im1.jpg',
      'restaurantName': 'UMENOHANA นิฮอนมูระมอลล์',
      'description':
          'ร้านนี้โดดเด่นที่เมนูเต้าหู้ มาแล้วต้องลองกับฟองเต้าหู้สดที่เราต้มเองกับมือ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          ' UMENOHANA นำเสนอประสบการณ์อาหารญี่ปุ่นแบบไคเซกิ โดยเน้นเมนูที่ทำจากเต้าหู้หลากหลายรูปแบบ ไม่ว่าจะเป็นเต้าหู้สดที่ทำเอง, เต้าหู้ทอดกรอบ, หรือเต้าหู้ในซุปใส บรรยากาศเงียบสงบสไตล์ญี่ปุ่นแท้ๆ เหมาะสำหรับผู้ที่ชื่นชอบอาหารเพื่อสุขภาพและรสชาติละเอียดอ่อน',
      'openingHours':
          "จันทร์ - ศุกร์ 11:00 - 22:00\nเสาร์ - อาทิตย์ 10:00 - 23:00",
      'phoneNumber': "02-987-6543",
      'location': "นิฮอนมูระมอลล์ ทองหล่อ 13",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'id': 'simple_day_gelato_003',
      'imageUrl': 'assets/imgs/im2.jpg',
      'restaurantName': 'Simple Day Gelato',
      'description':
          'ร้านเล็กๆสำหรับคนรักขนมหวานที่เรานำทุกเมนูโปรด ชนิดที่เรียกว่าเป็นขนมที่ต้องมีติดบ้านไว้เสมอ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 1.5,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          ' เป็นร้านขนมหวานรสชาตินุ่มละมุนที่ครองใจลูกค้าเป็นอย่างดี โดยมีเมนูของหวานอร่อยให้เลือกหลากหลายเมนู อาทิ Shibuya Honey Toast, เค้กช็อกโกแลต เครื่องดื่มสดชื่น บรรยากาศดี',
      'openingHours': "ทุกวัน 10:30 - 21:30",
      'phoneNumber': "000-0000-000",
      'location':
          "ชั้น G หน้าบิ๊กซีใหญ่ บางแคเหนือ บางแค กรุงเทพมหานคร (เดอะมอลล์บางแค)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'id': 'mit_ko_yuan_004',
      'imageUrl': 'assets/imgs/im3.jpg',
      'restaurantName': 'มิตรโกหย่วน',
      'description':
          ' ร้านอาหารตามสั่ง เจ้าเด็ดที่ต่อมา เราขอพาทุกคนไปอิ่มกับร้าน มิตรโกหย่วน แถวย่านย่านเสาชิงช้า รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 0.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          ' มิตรโกหย่วน คือร้านอาหารตามสั่งเก่าแก่ที่ขึ้นชื่อเรื่องความอร่อยแบบไทยแท้ๆ ทุกจานปรุงสดใหม่ด้วยวัตถุดิบคุณภาพ เมนูที่พลาดไม่ได้คือข้าวผัดกะเพราและแกงเขียวหวานรสจัดจ้าน เหมาะสำหรับมื้อกลางวันที่ต้องการความอิ่มอร่อยและคุ้มค่า',
      'openingHours': "จันทร์ - ศุกร์ 09:00 - 18:00\nเสาร์ - อาทิตย์ หยุด",
      'phoneNumber': "081-234-5678",
      'location':
          "ถนนดินสอ แขวงบวรนิเวศ เขตพระนคร กรุงเทพมหานคร (ใกล้ศาลาว่าการกรุงเทพมหานคร)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'id': 'somtum_mong_pladaek_005',
      'imageUrl': 'assets/imgs/im4.jpg',
      'restaurantName': 'ส้มตำหม่องปลาแดก',
      'description':
          'ร้านส้มตำที่ขึ้นชื่อเรื่องความจัดจ้านแบบไม่เป็นสองรองใครในย่านลาดกระบัง สารพัดเมนูตำแซ่บๆ มาเพียบ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': false,
      'showMotorcycleIcon': true,
      'details':
          ' ส้มตำหม่องปลาแดก เป็นสวรรค์ของคนรักส้มตำปลาร้า ด้วยรสชาติที่จัดจ้านถึงใจและวัตถุดิบสดใหม่ เมนูหลากหลายตั้งแต่ส้มตำปูปลาร้า ไปจนถึงตำถาดรสแซ่บเผ็ดร้อน บรรยากาศร้านเป็นกันเอง เหมาะกับการมาสังสรรค์กับเพื่อนๆ',
      'openingHours': "ทุกวัน 11:00 - 21:00",
      'phoneNumber': "098-765-4321",
      'location': "ลาดกระบัง ซอย 13 กรุงเทพมหานคร",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    {
      'id': 'mei_muek_sashimi_006',
      'imageUrl': 'assets/imgs/im5.jpg',
      'restaurantName': 'เหมยหมึกเป็นซาชิมิ',
      'description':
          'ร้านของเราคือการคัดสรรวัตถุดิบคุณภาพ เมนูอาหารทะเลที่หลากหลายกว่า 200 เมนู ไม่ต้องไปไกลถึงทะเล ร้านเราก็มีขาย! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 0.1,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          ' เหมยหมึกเป็นซาชิมิ ร้านอาหารทะเลสดๆ ที่นำเสนอเมนูปลาหมึกเป็นซาชิมิที่หาทานยาก พร้อมอาหารทะเลอื่นๆ อีกกว่า 200 เมนู เช่น กุ้งเผา, ปูผัดผงกะหรี่ และหอยเชลล์อบเนย การันตีความสดใหม่เหมือนยกทะเลมาไว้ที่ร้าน',
      'openingHours': "ทุกวัน 12:00 - 23:00",
      'phoneNumber': "080-111-2222",
      'location': "ถนนพระราม 9 กรุงเทพมหานคร (ใกล้แยกผังเมือง)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      // Wrap the entire content in a Stack to allow Positioned widgets
      child: Stack(
        // <--- Wrap with Stack
        children: [
          Column(
            children: [
              // AppBar is now directly a child of the Column, wrapped in PreferredSize.
              PreferredSize(
                preferredSize: Size.fromHeight(
                  8 * 12,
                ), // Height of your original AppBar
                child: AppBar(
                  backgroundColor: Colors.pink[200],
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/imgs/logoHome.png",
                      height: 8 * 10,
                      fit: BoxFit.contain,
                    ),
                  ),
                  toolbarHeight: 8 * 12, // Redundant here but harmless
                  automaticallyImplyLeading: false,
                  actions: [
                    TextButton(
                      onPressed: () {
                       Get.offAll(LoginUi());
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
              ),
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
                      controller: scrollpageController.scrollController,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Formsearch(),
                          const LocationFilterBar(),
                          const SizedBox(height: 8),
                          Slideim(),
                          const SizedBox(height: 8),
                          ...restaurantList.map((restaurantData) {
                            final String restaurantId =
                                restaurantData['id'] as String? ?? 'default_id';
                            final String imageUrl =
                                restaurantData['imageUrl'] as String? ??
                                'assets/imgs/placeholder.png';
                            final String restaurantName =
                                restaurantData['restaurantName'] as String? ??
                                'ชื่อร้านไม่ระบุ';
                            final String description =
                                restaurantData['description'] as String? ??
                                'ไม่มีรายละเอียดร้านอาหาร';
                            final double rating =
                                (restaurantData['rating'] as double?) ?? 0.0;
                            final bool isOpen =
                                (restaurantData['isOpen'] as bool?) ?? false;
                            final bool showMotorcycleIcon =
                                (restaurantData['showMotorcycleIcon']
                                    as bool?) ??
                                false;
                            return RestaurantCard(
                              imageUrl: imageUrl,
                              restaurantName: restaurantName,
                              description: description,
                              rating: rating,
                              isOpen: isOpen,
                              showMotorcycleIcon: showMotorcycleIcon,
                              onTap: () {
                                Get.to(
                                  () => RestaurantDetailPageUi(
                                    restaurantId: restaurantId,
                                  ),
                                  binding: BindingsBuilder(() {
                                    Get.put(
                                      RestaurantDetailController(
                                        restaurantId: restaurantId,
                                      ),
                                      tag: restaurantId,
                                    );
                                  }),
                                );
                              },
                            );
                          }).toList(),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Positioned for the ScrollToTopButton is now correctly placed within the Stack.
          Obx(
            () => scrollpageController.showScrollToTopButton.value
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
    );
  }
}
