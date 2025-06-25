  
  import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

class Shoplist extends StatelessWidget {
  const Shoplist({super.key});
 static final List<Map<String, dynamic>> shopList = [
    {
      'id': 'F001',
      'imageUrl': 'assets/imgs/im1.png',
      'restaurantName': 'Pasta AMA',
      'description':
          'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false.obs,
      'showMotorcycleIcon': false,
      'details':
          '      Pasta AMA เป็นร้านอาหารอิตาเลียนที่เชี่ยวชาญด้านพาสต้าสดใหม่ ด้วยวัตถุดิบคุณภาพสูงและสูตรต้นตำรับ เมนูเด่นคือคาโบนาร่าที่เข้มข้น และเพสโต้ที่หอมกลิ่นใบโหระพาแท้ๆ บรรยากาศอบอุ่นเหมาะกับการมาทานกับครอบครัวหรือเพื่อนฝูง',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 24:00 น.",
      'phoneNumber': "088-662-8244",
      'location':
          "503/3 ชั้น 1 ยิ้มแย้ม โฮสเทล ถ. เพชรบุรี \nแขวงถนนพญาไท เขตราชเทวี กรุงเทพมหานคร 10400",
      'menuimage': 'assets/imgs/mu1.png',
      'bannerImage': 'assets/imgs/po1.png',
    },
    //----------------------------------
    {
      'id': 'F002',
      'imageUrl': 'assets/imgs/im2.jpg',
      'restaurantName': 'UMENOHANA นิฮอนมูระมอลล์',
      'description':
          'ร้านนี้โดดเด่นที่เมนูเต้าหู้ มาแล้วต้องลองกับฟองเต้าหู้สดที่เราต้มเองกับมือ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': true.obs,
      'showMotorcycleIcon': true,
      'details':
          '      UMENOHANA นำเสนอประสบการณ์อาหารญี่ปุ่นแบบไคเซกิ โดยเน้นเมนูที่ทำจากเต้าหู้หลากหลายรูปแบบ ไม่ว่าจะเป็นเต้าหู้สดที่ทำเอง, เต้าหู้ทอดกรอบ, หรือเต้าหู้ในซุปใส บรรยากาศเงียบสงบสไตล์ญี่ปุ่นแท้ๆ เหมาะสำหรับผู้ที่ชื่นชอบอาหารเพื่อสุขภาพและรสชาติละเอียดอ่อน',
      'openingHours':
          "ช่วงเที่ยง:11:00 - 15:00 น. \nช่วงเย็น:18:00 - 22:00 น. ",
      'phoneNumber': "084-438-3892",
      'location':
          "Nihonmura Mall ถ. ทองหล่อ แขวงคลองตันเหนือ เขตวัฒนา กรุงเทพมหานคร 10110",
      'menuimage': 'assets/imgs/mu2.png',
      'bannerImage': 'assets/imgs/po1.png',
    },
    //----------------------------------
    {
      'id': 'F003',
      'imageUrl': 'assets/imgs/im3.jpg',
      'restaurantName': 'Simple Day Gelato',
      'description':
          'ร้านเล็กๆสำหรับคนรักขนมหวานที่เรานำทุกเมนูโปรด ชนิดที่เรียกว่าเป็นขนมที่ต้องมีติดบ้านไว้เสมอ  รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 2.5,
      'isOpen': true.obs,
      'showMotorcycleIcon': true,
      'details':
          '      เป็นร้านขนมหวานรสชาตินุ่มละมุนที่ครองใจลูกค้าเป็นอย่างดี โดยมีเมนูของหวานอร่อยให้เลือกหลากหลายเมนู อาทิ Shibuya Honey Toast, เค้กช็อกโกแลต เครื่องดื่มสดชื่น บรรยากาศดี',
      'openingHours': "เวลาเปิด-ปิด: 10.00 - 20.00 น. (ปิดทุกวันพุธ)",
      'phoneNumber': "086-555-8789 ",
      'location':
          "94 ถนนราชพฤกษ์ แขวงบางระมาด เขตตลิ่งชัน กรุงเทพมหานคร 10170. ร้านอยู่ในโครงการ The Bloc ราชพฤกษ์",
      'menuimage': 'assets/imgs/mu3.png',
      'bannerImage': 'assets/imgs/po1.png',
    },
    //----------------------------------

    //----------------------------------
   
    //----------------------------------
    

    
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
  final List<Map<String, dynamic>> shopList = [
    {
      'id': 'F001',
      'imageUrl': 'assets/imgs/pama.png',
      'restaurantName': 'Pasta AMA',
      'description':
          'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false.obs,
      'showMotorcycleIcon': false,
      'details':
          '      Pasta AMA เป็นร้านอาหารอิตาเลียนที่เชี่ยวชาญด้านพาสต้าสดใหม่ ด้วยวัตถุดิบคุณภาพสูงและสูตรต้นตำรับ เมนูเด่นคือคาโบนาร่าที่เข้มข้น และเพสโต้ที่หอมกลิ่นใบโหระพาแท้ๆ บรรยากาศอบอุ่นเหมาะกับการมาทานกับครอบครัวหรือเพื่อนฝูง',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 24:00 น.",
      'phoneNumber': "088-662-8244",
      'location':
          "503/3 ชั้น 1 ยิ้มแย้ม โฮสเทล ถ. เพชรบุรี \nแขวงถนนพญาไท เขตราชเทวี กรุงเทพมหานคร 10400",
      'menuimage': 'assets/imgs/p1.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    //----------------------------------
    {
      'id': 'F002',
      'imageUrl': 'assets/imgs/im1.jpg',
      'restaurantName': 'UMENOHANA นิฮอนมูระมอลล์',
      'description':
          'ร้านนี้โดดเด่นที่เมนูเต้าหู้ มาแล้วต้องลองกับฟองเต้าหู้สดที่เราต้มเองกับมือ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': true.obs.obs,
      'showMotorcycleIcon': true,
      'details':
          '      UMENOHANA นำเสนอประสบการณ์อาหารญี่ปุ่นแบบไคเซกิ โดยเน้นเมนูที่ทำจากเต้าหู้หลากหลายรูปแบบ ไม่ว่าจะเป็นเต้าหู้สดที่ทำเอง, เต้าหู้ทอดกรอบ, หรือเต้าหู้ในซุปใส บรรยากาศเงียบสงบสไตล์ญี่ปุ่นแท้ๆ เหมาะสำหรับผู้ที่ชื่นชอบอาหารเพื่อสุขภาพและรสชาติละเอียดอ่อน',
      'openingHours':
          "ช่วงเที่ยง:11:00 - 15:00 น. \nช่วงเย็น:18:00 - 22:00 น. ",
      'phoneNumber': "084-438-3892",
      'location':
          "Nihonmura Mall ถ. ทองหล่อ แขวงคลองตันเหนือ เขตวัฒนา กรุงเทพมหานคร 10110",
      'menuimage': 'assets/imgs/u1.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    //----------------------------------
    {
      'id': 'F003',
      'imageUrl': 'assets/imgs/im2.jpg',
      'restaurantName': 'Simple Day Gelato',
      'description':
          'ร้านเล็กๆสำหรับคนรักขนมหวานที่เรานำทุกเมนูโปรด ชนิดที่เรียกว่าเป็นขนมที่ต้องมีติดบ้านไว้เสมอ  รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 2.5,
      'isOpen': true.obs,
      'showMotorcycleIcon': true,
      'details':
          '      เป็นร้านขนมหวานรสชาตินุ่มละมุนที่ครองใจลูกค้าเป็นอย่างดี โดยมีเมนูของหวานอร่อยให้เลือกหลากหลายเมนู อาทิ Shibuya Honey Toast, เค้กช็อกโกแลต เครื่องดื่มสดชื่น บรรยากาศดี',
      'openingHours': "เวลาเปิด-ปิด: 10.00 - 20.00 น. (ปิดทุกวันพุธ)",
      'phoneNumber': "086-555-8789 ",
      'location':
          "94 ถนนราชพฤกษ์ แขวงบางระมาด เขตตลิ่งชัน กรุงเทพมหานคร 10170. ร้านอยู่ในโครงการ The Bloc ราชพฤกษ์",
      'menuimage': 'assets/imgs/s1.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },

    

    
  ];
