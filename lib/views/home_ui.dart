import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/widgets/homewid/LocationFilterBar.dart';
import 'package:get/get.dart';
// ตรวจสอบการ import ให้ถูกต้อง เช่น '้homewid' เป็น 'homewid' หรือ 'home_widgets'
import 'package:food_near_me_app/views/widgets/homewid/formsearch.dart';
import 'package:food_near_me_app/views/widgets/homewid/item.dart';
import 'package:food_near_me_app/views/widgets/homewid/slideim.dart';
import 'package:food_near_me_app/views/login_ui.dart';

import 'controllers/scrollctrl.dart'; 

// Import HomeController ของคุณ
// import 'package:food_near_me_app/controllers/home_controller.dart';



class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollpageController controller = Get.put(ScrollpageController());

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
                // หาก HomeUi เป็นแท็บใน PersistentTabView
                // การนำทางไป LoginUi ควรใช้ rootNavigator: true เพื่อให้ไปแสดงทับ Bottom Navbar
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(builder: (context) => LoginUi()),
                );
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
            SizedBox(width: 10),
          ],
        ),

       
        
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        controller: controller.scrollController,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Formsearch(),
                            LocationFilterBar(),
                            Slideim(),
                            SizedBox(height: 8),
                            // RestaurantCard หลายๆ อัน
                            RestaurantCard(
                                imageUrl: 'assets/imgs/pama.png',
                                restaurantName: 'Pasta AMA',
                                description:
                                    'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
                                rating: 5,
                                isOpen: false,
                                showMotorcycleIcon: false),
                            RestaurantCard(
                                imageUrl: 'assets/imgs/im1.jpg',
                                restaurantName: 'UMENOHANA นิฮอนมูระมอลล์',
                                description:
                                    'ร้านนี้โดดเด่นที่เมนูเต้าหู้ มาแล้วต้องลองกับฟองเต้าหู้สดที่เราต้มเองกับมือ! รายละเอียดเพิ่มเติม คลิกได้เลย',
                                rating: 3.5,
                                isOpen: true,
                                showMotorcycleIcon: true),
                            RestaurantCard(
                                imageUrl: 'assets/imgs/im2.jpg',
                                restaurantName: 'Simple Day Gelato',
                                description:
                                    'ร้านเล็กๆสำหรับคนรักขนมหวานที่เรานำทุกเมนูโปรด ชนิดที่เรียกว่าเป็นขนมที่ต้องมีติดบ้านไว้เสมอ  รายละเอียดเพิ่มเติม คลิกได้เลย',
                                rating: 1.5,
                                isOpen: true,
                                showMotorcycleIcon: true),
                            RestaurantCard(
                                imageUrl: 'assets/imgs/im3.jpg',
                                restaurantName: 'มิตรโกหย่วน',
                                description:
                                    ' ร้านอาหารตามสั่ง เจ้าเด็ดที่ต่อมา เราขอพาทุกคนไปอิ่มกับร้าน มิตรโกหย่วน แถวย่านเสาชิงช้า รายละเอียดเพิ่มเติม คลิกได้เลย',
                                rating: 0.5,
                                isOpen: true,
                                showMotorcycleIcon: false),
                            RestaurantCard(
                                imageUrl: 'assets/imgs/im4.jpg',
                                restaurantName: 'ส้มตำหม่องปลาแดก',
                                description:
                                    'ร้านส้มตำที่ขึ้นชื่อเรื่องความจัดจ้านแบบไม่เป็นสองรองใครในย่านลาดกระบัง สารพัดเมนูตำแซ่บๆ มาเพียบ! รายละเอียดเพิ่มเติม คลิกได้เลย',
                                rating: 4.5,
                                isOpen: false,
                                showMotorcycleIcon: true),
                            RestaurantCard(
                                imageUrl: 'assets/imgs/im5.jpg',
                                restaurantName: 'เหมยหมึกเป็นซาชิมิ',
                                description:
                                    'ร้านของเราคือการคัดสรรวัตถุดิบคุณภาพ เมนูอาหารทะเลที่หลากหลายกว่า 200 เมนู ไม่ต้องไปไกลถึงทะเล ร้านเราก็มีขาย! รายละเอียดเพิ่มเติม คลิกได้เลย',
                                rating: 0.1,
                                isOpen: true,
                                showMotorcycleIcon: false),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            Obx(
              () => controller.showScrollToTopButton.value
                  ? Positioned(
                      right: 20.0,
                      // ปรับ bottom ให้เหมาะกับ Bottom Nav Bar ของ PersistentTabView ที่อยู่ด้านล่าง
                      // 16.0 คือ padding มาตรฐานด้านล่างของ PersistentTabView
                      bottom: MediaQuery.of(context).padding.bottom + 16.0, 
                      child: FloatingActionButton(
                        shape: const CircleBorder(),
                        onPressed: controller.scrollToTop,
                        mini: false,
                        backgroundColor: Colors.pink[200],
                        child: const Icon(Icons.keyboard_double_arrow_up_sharp, color: Colors.white, size: 35,),
                        
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