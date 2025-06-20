import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/details_ui.dart';
import 'package:food_near_me_app/views/myprofile_ui.dart';
import 'package:food_near_me_app/views/widgets/homewid/LocationFilterBar.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/views/widgets/homewid/formsearch.dart';
import 'package:food_near_me_app/views/widgets/homewid/item.dart';
import 'package:food_near_me_app/views/widgets/homewid/slideim.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/views/controllers/scrollctrl.dart';
import 'controllers/detailctrl.dart';
import 'widgets/matwid/scrolltotop_bt.dart';
class HomeUi extends StatelessWidget {
  const HomeUi({super.key});
  static final List<Map<String, dynamic>> restaurantList = [
    {
      'id': 'F001',
      'imageUrl': 'assets/imgs/pama.png',
      'restaurantName': 'Pasta AMA',
      'description':
          'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
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
      'isOpen': true,
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
      'isOpen': true,
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
    //----------------------------------
    {
      'id': 'F004',
      'imageUrl': 'assets/imgs/im3.jpg',
      'restaurantName': 'มิตรโกหย่วน',
      'description':
          'ร้านอาหารตามสั่ง เจ้าเด็ดที่ต่อมา เราขอพาทุกคนไปอิ่มกับร้าน มิตรโกหย่วน แถวย่านย่านเสาชิงช้า รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          '      มิตรโกหย่วน คือร้านอาหารตามสั่งเก่าแก่ที่ขึ้นชื่อเรื่องความอร่อยแบบไทยแท้ๆ ทุกจานปรุงสดใหม่ด้วยวัตถุดิบคุณภาพ เมนูที่พลาดไม่ได้คือข้าวผัดกะเพราและแกงเขียวหวานรสจัดจ้าน เหมาะสำหรับมื้อกลางวันที่ต้องการความอิ่มอร่อยและคุ้มค่า',
      'openingHours':
          "วันธรรมดา11:00-14:00,16:00-21:30\nวันเสาร์-อาทิตย์ 16:00-21:30",
      'phoneNumber': "092-434-9996",
      'location':
          "ถนนดินสอ แขวงบวรนิเวศ เขตพระนคร กรุงเทพมหานคร (ใกล้ศาลาว่าการกรุงเทพมหานคร)",
      'menuimage': 'assets/imgs/menu.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    //----------------------------------
    {
      'id': 'F005',
      'imageUrl': 'assets/imgs/im4.jpg',
      'restaurantName': 'ส้มตำหม่องปลาแดก',
      'description':
          'ร้านส้มตำที่ขึ้นชื่อเรื่องความจัดจ้านแบบไม่เป็นสองรองใครในย่านลาดกระบัง สารพัดเมนูตำแซ่บๆ มาเพียบ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.2,
      'isOpen': false,
      'showMotorcycleIcon': true,
      'details':
          '      ส้มตำหม่องปลาแดก เป็นสวรรค์ของคนรักส้มตำปลาร้า ด้วยรสชาติที่จัดจ้านถึงใจและวัตถุดิบสดใหม่ เมนูหลากหลายตั้งแต่ส้มตำปูปลาร้า ไปจนถึงตำถาดรสแซ่บเผ็ดร้อน บรรยากาศร้านเป็นกันเอง เหมาะกับการมาสังสรรค์กับเพื่อนๆ',
      'openingHours': "เปิดทุกวัน 11:00 - 21:00",
      'phoneNumber': "098-765-4321",
      'location':
          "โครงการ The O-Zone Airport ตรงข้ามสน.ลาดกระบัง, 1529 ถนนลาดกระบัง แขวง/เขตลาดกระบัง กรุงเทพฯ 10520",
      'menuimage': 'assets/imgs/a1.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    //----------------------------------
    {
      'id': 'F006',
      'imageUrl': 'assets/imgs/im7.avif',
      'restaurantName': 'เหมยหมึกเป็นซาชิมิ',
      'description':
          'ร้านของเราคือการคัดสรรวัตถุดิบคุณภาพ เมนูอาหารทะเลที่หลากหลายไม่ต้องไปไกลถึงทะเล ร้านเราก็มีขาย! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          '      เหมยหมึกเป็นซาชิมิ ร้านอาหารทะเลสดๆ ที่นำเสนอเมนูปลาหมึกเป็นซาชิมิที่หาทานยาก พร้อมอาหารทะเลอื่นๆ อีกกว่า 200 เมนู เช่น กุ้งเผา, ปูผัดผงกะหรี่ และหอยเชลล์อบเนย การันตีความสดใหม่เหมือนยกทะเลมาไว้ที่ร้าน',
      'openingHours': "ทุกวัน 12:00 - 23:00",
      'phoneNumber': "085-336-7631",
      'location':
          "249 หมู่9 ร้านเหมย หมึกเป็นซาชิมิ \nแขวงทวีวัฒนา เขตทวีวัฒนา กรุงเทพมหานคร 10170",
      'menuimage': 'assets/imgs/a2.png',
      'bannerImage': 'assets/imgs/pomo.png',
    },
    //----------------------------------
    {
      'id': 'F007',
      'imageUrl': 'assets/imgs/im8.jpg',
      'restaurantName': 'ก๋วยเตี๋ยวเรือทองสมิทธ์',
      'description':
          'ร้านก๋วยเตี๋ยวเรือเจ้าดังที่มีเอกลักษณ์เฉพาะตัว รสชาติเข้มข้น ครบเครื่อง เส้นเหนียวนุ่ม รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          '      ร้านก๋วยเตี๋ยวเรือสุดพรีเมี่ยม บอกเลยว่ารสชาติก๋วยเตี๋ยวเรือของร้านนี้เข้มข้น จัดจ้าน บวกกับเนื้อคุณภาพดี ละลายในปากคือฟินที่สุดแล้วจ้าา นอกจากนี้เค้ายังมีเมนูหมูคุโรบุตะ และ กระดูกแก้ว สุดแสนอร่อยกรุบกรับ ก็เป็นอะไรที่พลาดไม่ได้นะบอกเลย!',
      'openingHours': "เปิดทุกวัน 10:00 - 22:00 น.",
      'phoneNumber': " 065-937-7386 ",
      'location':
          "518 , กรุงเทพมหานคร (ทองสมิทธ์ The Mall Lifestore Bangkae ร้านอยู่ชั้น G ใกล้กับ Gourmet) ",
      'menuimage': 'assets/imgs/t2.jpg',
      'bannerImage': 'assets/imgs/t3.jpg',
    },
    //----------------------------------
    {
      'id': 'F008',
      'imageUrl': 'assets/imgs/im9.jpg',
      'restaurantName': 'มีตังค์ สเต็ก',
      'description':
          'มีตังค์ สเต็ก อร่อยคุ้มค่าเกินราคา! สัมผัสสเต็กเนื้อนุ่ม ชุ่มฉ่ำ รสชาติเข้มข้น ปรุงจากวัตถุดิบคุณภาพดี รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.2,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          '      มีตังค์ สเต็ก เราใส่ใจในทุกรายละเอียด ตั้งแต่การคัดเลือกเนื้อสเต็กเกรดพรีเมียม การหมักที่พิถีพิถัน ไปจนถึงการย่างที่ได้ระดับความสุกที่คุณต้องการ เพื่อให้ทุกคำที่กัดลงไปคือความสุขที่แท้จริง ไม่ว่าจะเป็นเนื้อวัว เนื้อหมู หรือเนื้อไก่ เราก็มีเมนูหลากหลายให้คุณได้เลือกสรร มาสัมผัสประสบการณ์สเต็กที่ไม่เหมือนใครได้ที่ มีตังค์ สเต็ก แล้วคุณจะหลงรัก!',
      'openingHours': "เปิดทุกวัน 12.00 - 22.00 น​.",
      'phoneNumber': "095-862-0481  ",
      'location':
          "91/6 ข้างร้านซ่อมมอเตอร์ไซค์ ก่อนถึงซอย19, บางรักพัฒนา, บางบัวทอง, จ.นนทบุรี, 11110, ประเทศไทย นนทบุรี (ถนนเมน ระหว่างซอย​ 19 ก่อนถึงซอย19 ข้างร้านแชมป์มอไซด์)  ",
      'menuimage': 'assets/imgs/m1.jpg',
      'bannerImage': 'assets/imgs/m2.jpg',
    },
    //----------------------------------
    {
      'id': 'F009',
      'imageUrl': 'assets/imgs/im10.jpg',
      'restaurantName': 'Jones Salad',
      'description':
          'สุขภาพดีสร้างได้เริ่มต้นที่สลัดคุณให้ทุกมื้อเป็นเรื่องง่ายและดีต่อสุขภาพ กับสลัดที่คุณเลือกเองได้ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.8,
      'isOpen': false,
      'showMotorcycleIcon': true,
      'details':
          '      Jones Salad มากกว่าแค่สลัด คือมื้อแห่งความสุขที่ออกแบบมาเพื่อคุณโดยเฉพาะไม่ว่าคุณจะเป็นสายคลีน สายรักสุขภาพ หรือแค่อยากเติมความสดชื่น  พร้อมตอบโจทย์ทุกความต้องการ ด้วยผักสดนานาชนิด ท็อปปิ้งหลากหลาย คุณสามารถสร้างสรรค์สลัดในแบบของคุณเอง หรือเลือกเมนูยอดนิยมของเรา',
      'openingHours': "เปิดทุกวัน 08:00 - 21:00 น. ",
      'phoneNumber': "094-555-6430  ",
      'location':
          "518/1 ชั้น G, บางแคเหนือ บางแค กรุงเทพมหานคร กรุงเทพมหานคร   ",
      'menuimage': 'assets/imgs/s1.jpg',
      'bannerImage': 'assets/imgs/s2.jpg',
    },
    //----------------------------------
    {
      'id': 'F0010',
      'imageUrl': 'assets/imgs/a5.webp',
      'restaurantName': 'สุกี้จินดา',
      'description':
          'สุกี้จินดา ร้านสุกี้หม่าล่าเสียบไม้แบบสายพาน มีทั้งแบบสุกี้น้ำ และสุกี้แห้ง คุณสามารถเลือกน้ำซุปเองได้ มีน้ำซุปหลายรสชาติ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.0,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          '      คนรักสุกี้หม่าล่า พลาดไม่ได้เด็ดขาด สุกี้จินดา มีไลน์อาหารให้เลือก มากกว่า 80+ เมนู คุณสามารถทานได้ไม่อั้นกับเวลา 1:30 ชม. (90 นาที) ในราคา 388 บาท  จัดเต็มสุกี้หม่าล่า น้ำซุป น้ำจิ้ม ของหวาน ผลไม้ เครื่องดื่ม',
      'openingHours': "เปิดทุกวัน 11:00 น. ถึง 04:00 น.  ",
      'phoneNumber': "091-795-3839  ",
      'location':
          "ปากซอยลาดพร้าววังหิน 26 ถนนลาดพร้าววังหิน แขวง/เขตลาดพร้าว กรุงเทพฯ",
      'menuimage': 'assets/imgs/a3.jpg',
      'bannerImage': 'assets/imgs/a4.jpg',
    },
     //----------------------------------
    {
      'id': 'F0011',
      'imageUrl': 'assets/imgs/im13.jpg',
      'restaurantName': 'petrichor เพทริเคอร์ คาเฟ่',
      'description':
          'petrichorที่ซึ่งกลิ่นไอธรรมชาติโอบกอดความสุขของคนรักสัตว์  เพลิดเพลินกับเครื่องดื่มและของว่างแสนอร่อย พร้อมบริการ  รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.4,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details':
          '      สัมผัสบรรยากาศอบอุ่น ผ่อนคลาย  คุณจะได้เพลิดเพลินกับหลากหลายเมนูเครื่องดื่มและของว่างแสนอร่อย'
          'ในขณะที่สัตว์เลี้ยงของคุณก็มีพื้นที่ส่วนตัวให้วิ่งเล่นและผ่อนคลายได้อย่างเต็มที่เราเชื่อว่าความสุขคือการได้ใช้เวลาร่วมกัน' 
          'และแบ่งปันช่วงเวลาแห่งความสุขกับคนที่คุณรัก รวมถึงสมาชิกสี่ขาของครอบครัวคุณ ',
      'openingHours': "เปิดทุกวัน เวลา 9:30 - 18:30 น. \nยกเว้นวันอังคารที่ร้านจะปิดทำการ",
      'phoneNumber': "064-624-3559",
      'location':
          "88 หมู่2 ถนน ทวีวัฒนา แขวงทวีวัฒนา เขตทวีวัฒนา กรุงเทพมหานคร 10170",
      'menuimage': 'assets/imgs/a6.jpg',
      'bannerImage': 'assets/imgs/a7.jpg',
    },
     //----------------------------------
         {
      'id': 'F0012',
      'imageUrl': 'assets/imgs/im14.png',
      'restaurantName': 'SHU DAXIA Hotpot ',
      'description':
          'ร้านชาบูหม่าล่าอร่อยๆ ในกรุงเทพฯ หลายคนจะต้องนึกถึงร้านนี้ SHU DAXIA Hotpot เพราะที่นี่คือร้านหม่าล่าหม้อไฟหัวมังกร รสชาติต้นตำรับจากเมืองเฉิงตู ประเทศจีน  รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.0,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          '      สู่ต้าเสียคุณจะได้ทานทั้งเมนูร้านหม่าล่าหม้อไฟแสนอร่อย แล้วยังได้เพลินไปกับการแสดงสุดอลังการของทางร้าน ฟินได้ในทุกจุดไม่ว่าจะเป็นเมนูอาหาร การตกแต่งร้าน และการบริการ ต้องยอมรับว่าเค้าทำถึงจริงๆ ที่ร้านมีโต๊ะที่นั่งหลายขนาด รวมไปถึงห้องส่วนตัวสุดพรีเมียม ที่สามารถรองรับได้ตั้งแต่ 8-40 คน ตอบโจทย์ได้ทั้งครอบครัวเล็ก ครอบครัวใหญ่ รวมไปถึงการนัดสังสรรค์ของแกงค์เพื่อนฝูง',
      'openingHours': "เปิดทุกวัน เวลา 10:00 น. - 03:00 น",
      'phoneNumber': "094-491-3900",
      'location':
          "ถ. ประดิษฐ์มนูธรรม 19 แขวงคลองจั่น บางกะปิ กรุงเทพมหานคร 10240",
      'menuimage': 'assets/imgs/a9.jpg',
      'bannerImage': 'assets/imgs/a8.jpg',
    },
     //----------------------------------
        {
      'id': 'F0013',
      'imageUrl': 'assets/imgs/im15.jpg',
      'restaurantName': 'Hongdae Buffet ',
      'description':
          'ปิ้งย่างเกาหลีต้นตำรับ วัตถุดิบคุณภาพแน่นๆ ที่ Hongdae Buffet ทุกคำคือความสุข รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.8,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          '      ถ้าคุณกำลังมองหา บุฟเฟต์ปิ้งย่างเกาหลีแท้ๆ ที่ให้คุณอิ่มอร่อยได้ไม่อั้นในบรรยากาศสบายๆ ต้องมาที่ Hongdae Buffet '
          'ปิ้งย่างเกาหลีพรีเมียมที่คุณไม่ควรพลาด!Hongdae Buffet โดดเด่นด้วย วัตถุดิบคุณภาพสูง'
           'ทั้งหมูหมักซอสเกาหลี หมูสามชั้น เนื้อวัวพรีเมียม และ ซีฟู้ดสดๆ ให้คุณปิ้งย่างได้อย่างจุใจ'
            'พร้อมน้ำจิ้มสูตรเด็ด ที่เป็นเอกลักษณ์ของร้าน และ เครื่องเคียงนานาชนิด ที่เติมได้ไม่อั้น เพื่อให้มื้ออาหารของคุณสมบูรณ์แบบตามสไตล์เกาหลีแท้ๆ',
      'openingHours': "เปิดทุกวัน เวลา 11:00 น. ถึง 22:00 น",
      'phoneNumber': "064-165-7175",
      'location':
          "Siam Square One ชั้น 5 และ Future Park รังสิต ชั้น G",
      'menuimage': 'assets/imgs/a10.jpg',
      'bannerImage': 'assets/imgs/a11.jpg',
    },
     //----------------------------------
        {
      'id': 'F0014',
      'imageUrl': 'assets/imgs/im16.jpg',
      'restaurantName': 'KFC',
      'description':
          'KFC กรอบนอก นุ่มใน...อร่อยทุกคำ ที่ทุกคนหลงรัก รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details':
          '      ไก่ทอดร้อนๆ กรอบนอก นุ่มใน: หัวใจหลักของ KFC คือไก่ทอดสูตรต้นตำรับ 11 เครื่องเทศ ที่ทอดจนหนังไก่เหลืองทอง กรอบฟู แต่เนื้อด้านในยังคงนุ่ม ชุ่มฉ่ำ รสชาติเข้าถึงเนื้อทุกชิ้นKFC มีสาขาอยู่ทั่วประเทศ ทั้งในห้างสรรพสินค้า ปั๊มน้ำมัน หรือตามแหล่งชุมชน ทำให้คุณสามารถเข้าถึงความอร่อยได้ง่ายๆ สะดวกสบาย ไม่ว่าจะสั่งกลับบ้าน ทานที่ร้าน หรือใช้บริการเดลิเวอรี่',
      'openingHours': "เปิดทุกวัน 10:00 น. ถึง 21:00 น.",
      'phoneNumber': "020-290-700",
      'location':
          " เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuimage': 'assets/imgs/k1.jpg',
      'bannerImage': 'assets/imgs/k2.jpg',
    },
     //----------------------------------
    {
      'id': 'F0015',
      'imageUrl': 'assets/imgs/im17.jpg',
      'restaurantName': 'Mister Donut',
      'description':
          'Mister Donut เติมความสุขให้ทุกวัน ด้วยโดนัทหลากหลายสไตล์ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          '      ถ้าคุณกำลังมองหาของว่างยามบ่าย ขนมทานเล่นระหว่างวัน หรืออะไรหวานๆ หอมๆ มาเติมเต็มความสุขเล็กๆ น้อยๆ ในชีวิต ขอแนะนำ Mister Donut เลยครับ ร้านโดนัทชื่อดังที่อยู่คู่คนไทยมาอย่างยาวนาน ด้วยสโลแกนที่คุ้นหูว่า "ความสุขใหม่ใหม่ มีได้เสมอ" Mister Donut พร้อมเสิร์ฟความอร่อยที่หลากหลายและสร้างรอยยิ้มให้กับทุกคน',
      'openingHours': "เปิดทุกวัน จันทร์-ศุกร์ 10.00 - 21.30 น.  ",
      'phoneNumber': "091-795-3839  ",
      'location':
          "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuimage': 'assets/imgs/a14.jpg',
      'bannerImage': 'assets/imgs/a12.jpg',
    },
     //----------------------------------
    {
      'id': 'F0016',
      'imageUrl': 'assets/imgs/im18.jpg',
      'restaurantName': 'สุกี้ตี๋น้อย',
      'description':
          'สุกี้ตี๋น้อย” บุฟเฟ่ต์ชาบูราคาหลักร้อยอร่อยไม่อั้น รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          '      บุฟเฟต์สุดคุ้มค่า ด้วยราคาที่ไม่แพง คุณสามารถทานได้ไม่อั้น ทั้งเนื้อหมูสไลด์บางๆ เนื้อวัวคุณภาพดี หมึก กุ้ง ลูกชิ้นหลากหลายชนิด และผักสดๆ นานาชนิด นอกจากนี้ยังมีเมนูทานเล่นอื่นๆ อีกมากมาย เช่น เกี๊ยวซ่า เฟรนช์ฟรายส์ และอีกหลากหลายรายการ',
      'openingHours': "เปิดทุกวัน 11:00 น. ถึง 04:00 น.  ",
      'phoneNumber': "091-795-3839  ",
      'location':
          "ปากซอยลาดพร้าววังหิน 26 ถนนลาดพร้าววังหิน แขวง/เขตลาดพร้าว กรุงเทพฯ",
      'menuimage': 'assets/imgs/a16.jpg',
      'bannerImage': 'assets/imgs/a15.jpg',
    },
     //----------------------------------
      {
      'id': 'F0017',
      'imageUrl': 'assets/imgs/im19.jpg',
      'restaurantName': 'Yoguruto โยกุรุโตะ ',
      'description':
          'ร้านโยเกิร์ตสดปั่นสไตล์ญี่ปุ่น ที่กำลังได้รับความนิยมอย่างมากในหมู่คนรักสุขภาพและผู้ที่ชื่นชอบเครื่องดื่มสดชื่นชอบ  รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details':
          '      โยเกิร์ตของ Yoguruto ทำจากโยเกิร์ตสด ทำให้ได้โปรไบโอติกธรรมชาติ ซึ่งดีต่อระบบขับถ่ายและช่วยเรื่องสุขภาพลำไส้ นอกจากนี้ยังสามารถเลือกปรับระดับความหวานได้ตามความต้องการ ทำให้เหมาะสำหรับผู้ที่ควบคุมน้ำตาล',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 24:00 น.",
      'phoneNumber': "088-662-8244",
      'location':
          "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuimage': 'assets/imgs/y2.jpg',
      'bannerImage': 'assets/imgs/y1.jpg',
    },
     //----------------------------------
    {
      'id': 'F0018',
      'imageUrl': 'assets/imgs/im20.jpg',
      'restaurantName': 'Swensen \'s',
      'description':
          'ร้านไอศกรีมและเค้กที่มีสาขาอยู่ทั่วประเทศไทย ด้วยรสชาติที่เป็นเลิศ เมนูที่หลากหลาย มีสินค้าใหม่มาให้ลิ้มลองตลอดปี พร้อมทั้งโปรโมชั่นมากมายให้ลูกค้าได้ชื่นใจไปกับสเวนเซ่น รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.0,
      'isOpen': false,
      'showMotorcycleIcon': true,
      'details':
          '      Swensen \'s ไม่ได้เป็นเพียงร้านไอศกรีม แต่เป็นที่ที่ผู้คนมาสร้างความทรงจำดีๆ ร่วมกัน ไม่ว่าจะในโอกาสพิเศษหรือในวันธรรมดาที่อยากเพิ่มความหวานให้กับชีวิต เติมเต็มความสุขด้วยความหวานเย็นชื่นใจ หรืออยากฉลองช่วงเวลาดีๆ กับคนพิเศษ ร้านไอศกรีมในตำนานที่อยู่คู่คนไทยมาอย่างยาวนาน ด้วยรสชาติที่เป็นเอกลักษณ์และหลากหลาย',
      'openingHours': "เปิดทุกวัน 10:00 น. ถึง 22:00 น.  ",
      'phoneNumber': "091-795-3839  ",
      'location':
          "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuimage': 'assets/imgs/a17.png',
      'bannerImage': 'assets/imgs/a18.jpg',
    },
     //----------------------------------
    {
      'id': 'F0019',
      'imageUrl': 'assets/imgs/im21.jpg',
      'restaurantName': 'ส้มตำนัว',
      'description':
          'ร้านส้มตำนัวเป็นที่รู้จักกันดีในเรื่องของเมนูส้มตำและอาหารอีสานรสชาติจัดจ้านถึงเครื่อง  รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 0.0,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details':
          '      ที่นี่มีส้มตำหลากหลายเมนูให้เลือก ไม่ว่าจะเป็นส้มตำไทย ส้มตำปูปลาร้า ส้มตำคอหมูย่าง และอีกมากมาย ทุกจานปรุงรสชาติได้อย่างเข้มข้น จัดจ้าน เผ็ด เปรี้ยว หวาน เค็ม ครบรสตามแบบฉบับส้มตำนัว',
      'openingHours': "เปิดทุกวัน 11:00 น. ถึง 04:00 น.  ",
      'phoneNumber': " 084-356-0080  ",
      'location':
          "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuimage': 'assets/imgs/a19.jpg',
      'bannerImage': 'assets/imgs/a20.jpg',
    },
     //----------------------------------
    {
      'id': 'F0020',
      'imageUrl': 'assets/imgs/im22.jpg',
      'restaurantName': 'ฉันจะกินชาเย็นทุกวัน ',
      'description':
          'ทุกวันคือวันชาเย็น! พบกับความสดชื่นหลากหลายสไตล์ที่ BEAMS CHA รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details':
          '      ชาเย็นหลากหลายสไตล์ ที่นี่ไม่ได้มีแค่ชาเย็นแบบไทยๆ แต่ยังผสมผสานแนวคิดใหม่ๆ เพื่อให้ได้ชาเย็นรสชาติแปลกใหม่และน่าตื่นเต้น ไม่ว่าจะเป็นชาเย็นที่เบสด้วยชาเขียว ชาอู่หลง หรือชาดำ ผสมผสานกับส่วนผสมอื่นๆ ที่สร้างความแตกต่าง',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 22:30 น",
      'phoneNumber': "0000-0000-0000",
      'location':
          "ชั้น G ใน The Mall Lifestore Bangkae ใกล้กับ Gourmet Market และ EVEANDBOY",
      'menuimage': 'assets/imgs/b2.jpg',
      'bannerImage': 'assets/imgs/b1.jpg',
    },
    //----------------------------------
    {
      'id': 'F0021',
      'imageUrl': 'assets/imgs/im23.jpg',
      'restaurantName': 'ผักฉ่ําคําหอม ',
      'description':
          'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details':
          '      Pasta AMA เป็นร้านอาหารอิตาเลียนที่เชี่ยวชาญด้านพาสต้าสดใหม่ ด้วยวัตถุดิบคุณภาพสูงและสูตรต้นตำรับ เมนูเด่นคือคาโบนาร่าที่เข้มข้น และเพสโต้ที่หอมกลิ่นใบโหระพาแท้ๆ บรรยากาศอบอุ่นเหมาะกับการมาทานกับครอบครัวหรือเพื่อนฝูง',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 24:00 น.",
      'phoneNumber': "088-662-8244",
      'location':
          "503/3 ชั้น 1 ยิ้มแย้ม โฮสเทล ถ. เพชรบุรี \nแขวงถนนพญาไท เขตราชเทวี กรุงเทพมหานคร 10400",
      'menuimage': 'assets/imgs/a21.jpg',
      'bannerImage': 'assets/imgs/a23.jpg',
    },
    //----------------------------------
    {
      'id': 'F0022',
      'imageUrl': 'assets/imgs/im24.png',
      'restaurantName': 'Saint Etoile by Yamazaki ',
      'description':
          'ร้านขนมปังสำหรับทุกเพศทุกวัยพร้อมเสิร์ฟความอร่อยด้วยขนมปังอบสดใหม่ทุกวัน รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details':
          ' เมนูหลากหลาย ตอบโจทย์ทุกคนไม่ว่าคุณจะชื่นชอบขนมปังประเภทไหน ที่นี่มีให้เลือกมากมาย ตั้งแต่ขนมปังแถวสำหรับทำแซนด์วิช, ขนมปังไส้ต่างๆ ที่มีทั้งคาวและหวาน (เช่น ไส้กรอก, หมูหยอง, ถั่วแดง, ครีม) ไปจนถึงเบเกอรี่สไตล์ญี่ปุ่นอย่างเมร่อนปัง (Melon Pan) หรือชีสเค้ก และพุดดิ้งต่างๆ',
      'openingHours': "เปิดทุกวันเวลา 10:00 - 22:00 น",
      'phoneNumber': "024-549-678",
      'location':
          " The Mall Lifestore",
      'menuimage': 'assets/imgs/a24.jpg',
      'bannerImage': 'assets/imgs/a25.jpg',
    },
    //----------------------------------
    

    
  ];
    @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>();

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
              height: 8 *10,
              fit: BoxFit.contain,
            ),
          ),
          toolbarHeight: 8 * 12,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white, size: 30), // ไอคอนรูปฟันเฟือง
              onPressed: () {
                Get.offAll(() => MyprofileUi()); // <<< นำทางไป MyProfileUI
              },
            ),
            const SizedBox(width: 10), // เพิ่มระยะห่างเล็กน้อย
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
           
        flexibleSpace: Container( // ใช้ flexibleSpace เพื่อใส่ Gradient
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink[200]!, // สีชมพูอ่อน
                  Colors.blue[200]!, // สีชมพูอ่อน
                  
                ],
                begin: Alignment.centerLeft,
                transform: GradientRotation( 3.0),
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
            Colors.blue[200]!,
            Colors.pink[200]!,
          ])
          ),
          child: Stack(
            
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
                              // ใช้ .map เพื่อสร้าง RestaurantCard จาก restaurantList
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
                                    // ใช้ Get.to พร้อม BindingsBuilder เพื่อจัดการ Controller lifecycle
                                    Get.to(
                                      () => RestaurantDetailPageUi(
                                            restaurantId: restaurantData['id']!,
                                          ),
                                      binding: BindingsBuilder(() {
                                        // Get.put() จะถูกเรียกเมื่อหน้านั้นถูกสร้างขึ้น
                                        // และจะถูก dispose เมื่อหน้านั้นถูก pop ออกจาก stack
                                        Get.put(
                                          RestaurantDetailController(
                                            restaurantId: restaurantData['id']!,
                                          ),
                                          tag: restaurantData['id']!, // ใช้ ID เป็น tag
                                        );
                                      }),
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
        ),
      ),
    );
  }
}