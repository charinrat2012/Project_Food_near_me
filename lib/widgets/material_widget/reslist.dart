import 'package:flutter/material.dart';

class Reslist {
  static final List<Map<String, dynamic>> restaurantList = [
    {
      'id': '1',
      'imageUrl': 'assets/imgs/im1.png',
      'ownerid': '1',
      'restaurantName': 'Pasta AMA',
      'description': 'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      Pasta AMA เป็นร้านอาหารอิตาเลียนที่เชี่ยวชาญด้านพาสต้าสดใหม่ ด้วยวัตถุดิบคุณภาพสูงและสูตรต้นตำรับ เมนูเด่นคือคาโบนาร่าที่เข้มข้น และเพสโต้ที่หอมกลิ่นใบโหระพาแท้ๆ บรรยากาศอบอุ่นเหมาะกับการมาทานกับครอบครัวหรือเพื่อนฝูง',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 24:00 น.",
      'phoneNumber': "088-662-8244",
      'location': "503/3 ชั้น 1 ยิ้มแย้ม โฮสเทล ถ. เพชรบุรี \nแขวงถนนพญาไท เขตราชเทวี กรุงเทพมหานคร 10400",
      'menuImages': ['assets/imgs/mu3.png', 'assets/imgs/mu2.png', 'assets/imgs/mu1.png'], // ตัวอย่างหลายรูป
      'promotion': ['assets/imgs/po1.png', 'assets/imgs/po7.jpg', 'assets/imgs/po8.jpg'],
      'type': 'อาหารอิตาเลียน',
    },
    {
      'id': '2',
      'imageUrl': 'assets/imgs/im2.jpg',
      'ownerid': '2',
      'restaurantName': 'UMENOHANA นิฮอนมูระมอลล์',
      'description': 'ร้านนี้โดดเด่นที่เมนูเต้าหู้ มาแล้วต้องลองกับฟองเต้าหู้สดที่เราต้มเองกับมือ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      UMENOHANA นำเสนอประสบการณ์อาหารญี่ปุ่นแบบไคเซกิ โดยเน้นเมนูที่ทำจากเต้าหู้หลากหลายรูปแบบ ไม่ว่าจะเป็นเต้าหู้สดที่ทำเอง, เต้าหู้ทอดกรอบ, หรือเต้าหู้ในซุปใส บรรยากาศเงียบสงบสไตล์ญี่ปุ่นแท้ๆ เหมาะสำหรับผู้ที่ชื่นชอบอาหารเพื่อสุขภาพและรสชาติละเอียดอ่อน',
      'openingHours': "ช่วงเที่ยง:11:00 - 15:00 น. \nช่วงเย็น:18:00 - 22:00 น. ",
      'phoneNumber': "084-438-3892",
      'location': "Nihonmura Mall ถ. ทองหล่อ แขวงคลองตันเหนือ เขตวัฒนา กรุงเทพมหานคร 10110",
      'menuImages': [], // กรณีไม่มีรูป
      'promotion': [], // กรณีไม่มีรูป
      'type': 'อาหารญี่ปุ่น',
    },
    {
      'id': '3',
      'imageUrl': 'assets/imgs/im3.jpg',
      'ownerid': '3',
      'restaurantName': 'Simple Day Gelato',
      'description': 'ร้านเล็กๆสำหรับคนรักขนมหวานที่เรานำทุกเมนูโปรด ชนิดที่เรียกว่าเป็นขนมที่ต้องมีติดบ้านไว้เสมอ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 2.5,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      เป็นร้านขนมหวานรสชาตินุ่มละมุนที่ครองใจลูกค้าเป็นอย่างดี โดยมีเมนูของหวานอร่อยให้เลือกหลากหลายเมนู อาทิ Shibuya Honey Toast, เค้กช็อกโกแลต เครื่องดื่มสดชื่น บรรยากาศดี',
      'openingHours': "เวลาเปิด-ปิด: 10.00 - 20.00 น. (ปิดทุกวันพุธ)",
      'phoneNumber': "086-555-8789 ",
      'location': "94 ถนนราชพฤกษ์ แขวงบางระมาด เขตตลิ่งชัน กรุงเทพมหานคร 10170. ร้านอยู่ในโครงการ The Bloc ราชพฤกษ์",
      'menuImages': ['assets/imgs/mu3.png'],
      'promotion': ['assets/imgs/po1.png'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '4',
      'imageUrl': 'assets/imgs/im4.jpg',
      'ownerid': '2',
      'restaurantName': 'มิตรโกหย่วน',
      'description': 'ร้านอาหารตามสั่ง เจ้าเด็ดที่ต่อมา เราขอพาทุกคนไปอิ่มกับร้าน มิตรโกหย่วน แถวย่านย่านเสาชิงช้า รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      มิตรโกหย่วน คือร้านอาหารตามสั่งเก่าแก่ที่ขึ้นชื่อเรื่องความอร่อยแบบไทยแท้ๆ ทุกจานปรุงสดใหม่ด้วยวัตถุดิบคุณภาพ เมนูที่พลาดไม่ได้คือข้าวผัดกะเพราและแกงเขียวหวานรสจัดจ้าน เหมาะสำหรับมื้อกลางวันที่ต้องการความอิ่มอร่อยและคุ้มค่า',
      'openingHours': "วันธรรมดา11:00-14:00,16:00-21:30\nวันเสาร์-อาทิตย์ 16:00-21:30",
      'phoneNumber': "092-434-9996",
      'location': "ถนนดินสอ แขวงบวรนิเวศ เขตพระนคร กรุงเทพมหานคร (ใกล้ศาลาว่าการกรุงเทพมหานคร)",
      'menuImages': ['assets/imgs/mu4.png'],
      'promotion': ['assets/imgs/po1.png'],
      'type': 'อาหารตามสั่ง',
    },
    {
      'id': '5',
      'imageUrl': 'assets/imgs/im5.jpg',
      'ownerid': '3',
      'restaurantName': 'ส้มตำหม่องปลาแดก',
      'description': 'ร้านส้มตำที่ขึ้นชื่อเรื่องความจัดจ้านแบบไม่เป็นสองรองใครในย่านลาดกระบัง สารพัดเมนูตำแซ่บๆ มาเพียบ! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.2,
      'isOpen': false,
      'showMotorcycleIcon': true,
      'details': '      ส้มตำหม่องปลาแดก เป็นสวรรค์ของคนรักส้มตำปลาร้า ด้วยรสชาติที่จัดจ้านถึงใจและวัตถุดิบสดใหม่ เมนูหลากหลายตั้งแต่ส้มตำปูปลาร้า ไปจนถึงตำถาดรสแซ่บเผ็ดร้อน บรรยากาศร้านเป็นกันเอง เหมาะกับการมาสังสรรค์กับเพื่อนๆ',
      'openingHours': "เปิดทุกวัน 11:00 - 21:00",
      'phoneNumber': "098-765-4321",
      'location': "โครงการ The O-Zone Airport ตรงข้ามสน.ลาดกระบัง, 1529 ถนนลาดกระบัง แขวง/เขตลาดกระบัง กรุงเทพฯ 10520",
      'menuImages': ['assets/imgs/mu5.png'],
      'promotion': ['assets/imgs/po1.png'],
      'type': 'อาหารอีสาน',
    },
    {
      'id': '6',
      'imageUrl': 'assets/imgs/im6.avif',
      'ownerid': '2',
      'restaurantName': 'เหมยหมึกเป็นซาชิมิ',
      'description': 'ร้านของเราคือการคัดสรรวัตถุดิบคุณภาพ เมนูอาหารทะเลที่หลากหลายไม่ต้องไปไกลถึงทะเล ร้านเราก็มีขาย! รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      เหมยหมึกเป็นซาชิมิ ร้านอาหารทะเลสดๆ ที่นำเสนอเมนูปลาหมึกเป็นซาชิมิที่หาทานยาก พร้อมอาหารทะเลอื่นๆ อีกกว่า 200 เมนู เช่น กุ้งเผา, ปูผัดผงกะหรี่ และหอยเชลล์อบเนย การันตีความสดใหม่เหมือนยกทะเลมาไว้ที่ร้าน',
      'openingHours': "ทุกวัน 12:00 - 23:00",
      'phoneNumber': "085-336-7631",
      'location': "249 หมู่9 ร้านเหมย หมึกเป็นซาชิมิ \nแขวงทวีวัฒนา เขตทวีวัฒนา กรุงเทพมหานคร 10170",
      'menuImages': ['assets/imgs/mu6.png'],
      'promotion': ['assets/imgs/po1.png'],
      'type': 'อาหารทะเล',
    },
    {
      'id': '7',
      'imageUrl': 'assets/imgs/im7.jpg',
      'ownerid': '3',
      'restaurantName': 'ก๋วยเตี๋ยวเรือทองสมิทธ์',
      'description': 'ร้านก๋วยเตี๋ยวเรือเจ้าดังที่มีเอกลักษณ์เฉพาะตัว รสชาติเข้มข้น ครบเครื่อง เส้นเหนียวนุ่ม รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      ร้านก๋วยเตี๋ยวเรือสุดพรีเมี่ยม บอกเลยว่ารสชาติก๋วยเตี๋ยวเรือของร้านนี้เข้มข้น จัดจ้าน บวกกับเนื้อคุณภาพดี ละลายในปากคือฟินที่สุดแล้วจ้าา นอกจากนี้เค้ายังมีเมนูหมูคุโรบุตะ และ กระดูกแก้ว สุดแสนอร่อยกรุบกรับ ก็เป็นอะไรที่พลาดไม่ได้นะบอกเลย!',
      'openingHours': "เปิดทุกวัน 10:00 - 22:00 น.",
      'phoneNumber': " 065-937-7386 ",
      'location': "518 , กรุงเทพมหานคร (ทองสมิทธ์ The Mall Lifestore Bangkae ร้านอยู่ชั้น G ใกล้กับ Gourmet) ",
      'menuImages': ['assets/imgs/mu7.jpg'],
      'promotion': ['assets/imgs/po7.jpg'],
      'type': 'ก๋วยเตี๋ยว',
    },
    {
      'id': '8',
      'imageUrl': 'assets/imgs/im8.jpg',
      'ownerid': '2',
      'restaurantName': 'มีตังค์ สเต็ก',
      'description': 'มีตังค์ สเต็ก อร่อยคุ้มค่าเกินราคา! สัมผัสสเต็กเนื้อนุ่ม ชุ่มฉ่ำ รสชาติเข้มข้น ปรุงจากวัตถุดิบคุณภาพดี รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.2,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      มีตังค์ สเต็ก เราใส่ใจในทุกรายละเอียด ตั้งแต่การคัดเลือกเนื้อสเต็กเกรดพรีเมียม การหมักที่พิถีพิถัน ไปจนถึงการย่างที่ได้ระดับความสุกที่คุณต้องการ เพื่อให้ทุกคำที่กัดลงไปคือความสุขที่แท้จริง ไม่ว่าจะเป็นเนื้อวัว เนื้อหมู หรือเนื้อไก่ เราก็มีเมนูหลากหลายให้คุณได้เลือกสรร มาสัมผัสประสบการณ์สเต็กที่ไม่เหมือนใครได้ที่ มีตังค์ สเต็ก แล้วคุณจะหลงรัก!',
      'openingHours': "เปิดทุกวัน 12.00 - 22.00 น​.",
      'phoneNumber': "095-862-0481 ",
      'location': "91/6 ข้างร้านซ่อมมอเตอร์ไซค์ ก่อนถึงซอย19, บางรักพัฒนา, บางบัวทอง, จ.นนทบุรี, 11110, ประเทศไทย นนทบุรี (ถนนเมน ระหว่างซอย​ 19 ก่อนถึงซอย19 ข้างร้านแชมป์มอไซด์) ",
      'menuImages': ['assets/imgs/mu8.jpg'],
      'promotion': ['assets/imgs/po8.jpg'],
      'type': 'อาหารยุโรป',
    },
    {
      'id': '9',
      'imageUrl': 'assets/imgs/im9.jpg',
      'ownerid': '2',
      'restaurantName': 'Jones Salad',
      'description': 'สุขภาพดีสร้างได้เริ่มต้นที่สลัดคุณให้ทุกมื้อเป็นเรื่องง่ายและดีต่อสุขภาพ กับสลัดที่คุณเลือกเองได้ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.8,
      'isOpen': false,
      'showMotorcycleIcon': true,
      'details': '      Jones Salad มากกว่าแค่สลัด คือมื้อแห่งความสุขที่ออกแบบมาเพื่อคุณโดยเฉพาะไม่ว่าคุณจะเป็นสายคลีน สายรักสุขภาพ หรือแค่อยากเติมความสดชื่น พร้อมตอบโจทย์ทุกความต้องการ ด้วยผักสดนานาชนิด ท็อปปิ้งหลากหลาย คุณสามารถสร้างสรรค์สลัดในแบบของคุณเอง หรือเลือกเมนูยอดนิยมของเรา',
      'openingHours': "เปิดทุกวัน 08:00 - 21:00 น. ",
      'phoneNumber': "094-555-6430 ",
      'location': "518/1 ชั้น G, บางแคเหนือ บางแค กรุงเทพมหานคร กรุงเทพมหานคร ",
      'menuImages': ['assets/imgs/mu9.jpg'],
      'promotion': ['assets/imgs/po9.jpg'],
      'type': 'อาหารเจ/มังสวิรัติ',
    },
    {
      'id': '10',
      'imageUrl': 'assets/imgs/im10.webp',
      'ownerid': '2',
      'restaurantName': 'สุกี้จินดา',
      'description': 'สุกี้จินดา ร้านสุกี้หม่าล่าเสียบไม้แบบสายพาน มีทั้งแบบสุกี้น้ำ และสุกี้แห้ง คุณสามารถเลือกน้ำซุปเองได้ มีน้ำซุปหลายรสชาติ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.0,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      คนรักสุกี้หม่าล่า พลาดไม่ได้เด็ดขาด สุกี้จินดา มีไลน์อาหารให้เลือก มากกว่า 80+ เมนู คุณสามารถทานได้ไม่อั้นกับเวลา 1:30 ชม. (90 นาที) ในราคา 388 บาท จัดเต็มสุกี้หม่าล่า น้ำซุป น้ำจิ้ม ของหวาน ผลไม้ เครื่องดื่ม',
      'openingHours': "เปิดทุกวัน 11:00 น. ถึง 04:00 น. ",
      'phoneNumber': "091-795-3839 ",
      'location': "ปากซอยลาดพร้าววังหิน 26 ถนนลาดพร้าววังหิน แขวง/เขตลาดพร้าว กรุงเทพฯ",
      'menuImages': ['assets/imgs/mu10.jpg'],
      'promotion': ['assets/imgs/po10.jpg'],
      'type': 'สุกี้/ชาบู',
    },
    {
      'id': '11',
      'imageUrl': 'assets/imgs/im11.jpg',
      'ownerid': '1',
      'restaurantName': 'petrichor เพทริเคอร์ คาเฟ่',
      'description': 'petrichorที่ซึ่งกลิ่นไอธรรมชาติโอบกอดความสุขของคนรักสัตว์ เพลิดเพลินกับเครื่องดื่มและของว่างแสนอร่อย พร้อมบริการ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.4,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      สัมผัสบรรยากาศอบอุ่น ผ่อนคลาย คุณจะได้เพลิดเพลินกับหลากหลายเมนูเครื่องดื่มและของว่างแสนอร่อยในขณะที่สัตว์เลี้ยงของคุณก็มีพื้นที่ส่วนตัวให้วิ่งเล่นและผ่อนคลายได้อย่างเต็มที่เราเชื่อว่าความสุขคือการได้ใช้เวลาร่วมกันและแบ่งปันช่วงเวลาแห่งความสุขกับคนที่คุณรัก รวมถึงสมาชิกสี่ขาของครอบครัวคุณ ',
      'openingHours': "เปิดทุกวัน เวลา 9:30 - 18:30 น. \nยกเว้นวันอังคารที่ร้านจะปิดทำการ",
      'phoneNumber': "064-624-3559",
      'location': "88 หมู่2 ถนน ทวีวัฒนา แขวงทวีวัฒนา เขตทวีวัฒนา กรุงเทพมหานคร 10170",
      'menuImages': ['assets/imgs/mu11.jpg'],
      'promotion': ['assets/imgs/po11.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '12',
      'imageUrl': 'assets/imgs/im23.png',
      'ownerid': '2',
      'restaurantName': 'SHU DAXIA Hotpot ',
      'description': 'ร้านชาบูหม่าล่าอร่อยๆ ในกรุงเทพฯ หลายคนจะต้องนึกถึงร้านนี้ SHU DAXIA Hotpot เพราะที่นี่คือร้านหม่าล่าหม้อไฟหัวมังกร รสชาติต้นตำรับจากเมืองเฉิงตู ประเทศจีน รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.0,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      สู่ต้าเสียคุณจะได้ทานทั้งเมนูร้านหม่าล่าหม้อไฟแสนอร่อย แล้วยังได้เพลินไปกับการแสดงสุดอลังการของทางร้าน ฟินได้ในทุกจุดไม่ว่าจะเป็นเมนูอาหาร การตกแต่งร้าน และการบริการ ต้องยอมรับว่าเค้าทำถึงจริงๆ ที่ร้านมีโต๊ะที่นั่งหลายขนาด รวมไปถึงห้องส่วนตัวสุดพรีเมียม ที่สามารถรองรับได้ตั้งแต่ 8-40 คน ตอบโจทย์ได้ทั้งครอบครัวเล็ก ครอบครัวใหญ่ รวมไปถึงการนัดสังสรรค์ของแกงค์เพื่อนฝูง',
      'openingHours': "เปิดทุกวัน เวลา 10:00 น. - 03:00 น",
      'phoneNumber': "094-491-3900",
      'location': "ถ. ประดิษฐ์มนูธรรม 19 แขวงคลองจั่น บางกะปิ กรุงเทพมหานคร 10240",
      'menuImages': ['assets/imgs/mu12.jpg'],
      'promotion': ['assets/imgs/po12.jpg'],
      'type': 'อาหารจีน , สุกี้/ชาบู',
    },
    {
      'id': '13',
      'imageUrl': 'assets/imgs/im13.jpg',
      'ownerid': '3',
      'restaurantName': 'Hongdae Buffet ',
      'description': 'ปิ้งย่างเกาหลีต้นตำรับ วัตถุดิบคุณภาพแน่นๆ ที่ Hongdae Buffet ทุกคำคือความสุข รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.8,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ถ้าคุณกำลังมองหา บุฟเฟต์ปิ้งย่างเกาหลีแท้ๆ ที่ให้คุณอิ่มอร่อยได้ไม่อั้นในบรรยากาศสบายๆ ต้องมาที่ Hongdae Buffet ปิ้งย่างเกาหลีพรีเมียมที่คุณไม่ควรพลาด!Hongdae Buffet โดดเด่นด้วย วัตถุดิบคุณภาพสูงทั้งหมูหมักซอสเกาหลี หมูสามชั้น เนื้อวัวพรีเมียม และ ซีฟู้ดสดๆ ให้คุณปิ้งย่างได้อย่างจุใจพร้อมน้ำจิ้มสูตรเด็ด ที่เป็นเอกลักษณ์ของร้าน และ เครื่องเคียงนานาชนิด ที่เติมได้ไม่อั้น เพื่อให้มื้ออาหารของคุณสมบูรณ์แบบตามสไตล์เกาหลีแท้ๆ',
      'openingHours': "เปิดทุกวัน เวลา 11:00 น. ถึง 22:00 น",
      'phoneNumber': "064-165-7175",
      'location': "Siam Square One ชั้น 5 และ Future Park รังสิต ชั้น G",
      'menuImages': ['assets/imgs/mu13.jpg'],
      'promotion': ['assets/imgs/po13.jpg'],
      'type': 'อาหารเกาหลี',
    },
    {
      'id': '14',
      'imageUrl': 'assets/imgs/im14.jpg',
      'ownerid': '3',
      'restaurantName': 'KFC',
      'description': 'KFC กรอบนอก นุ่มใน...อร่อยทุกคำ ที่ทุกคนหลงรัก รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      ไก่ทอดร้อนๆ กรอบนอก นุ่มใน: หัวใจหลักของ KFC คือไก่ทอดสูตรต้นตำรับ 11 เครื่องเทศ ที่ทอดจนหนังไก่เหลืองทอง กรอบฟู แต่เนื้อด้านในยังคงนุ่ม ชุ่มฉ่ำ รสชาติเข้าถึงเนื้อทุกชิ้นKFC มีสาขาอยู่ทั่วประเทศ ทั้งในห้างสรรพสินค้า ปั๊มน้ำมัน หรือตามแหล่งชุมชน ทำให้คุณสามารถเข้าถึงความอร่อยได้ง่ายๆ สะดวกสบาย ไม่ว่าจะสั่งกลับบ้าน ทานที่ร้าน หรือใช้บริการเดลิเวอรี่',
      'openingHours': "เปิดทุกวัน 10:00 น. ถึง 21:00 น.",
      'phoneNumber': "020-290-700",
      'location': "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuImages': ['assets/imgs/mu14.jpg'],
      'promotion': ['assets/imgs/po14.jpg'],
      'type': 'อาหารยุโรป',
    },
    {
      'id': '15',
      'imageUrl': 'assets/imgs/im15.jpg',
      'ownerid': '1',
      'restaurantName': 'Mister Donut',
      'description': 'Mister Donut เติมความสุขให้ทุกวัน ด้วยโดนัทหลากหลายสไตล์ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ถ้าคุณกำลังมองหาของว่างยามบ่าย ขนมทานเล่นระหว่างวัน หรืออะไรหวานๆ หอมๆ มาเติมเต็มความสุขเล็กๆ น้อยๆ ในชีวิต ขอแนะนำ Mister Donut เลยครับ ร้านโดนัทชื่อดังที่อยู่คู่คนไทยมาอย่างยาวนาน ด้วยสโลแกนที่คุ้นหูว่า "ความสุขใหม่ใหม่ มีได้เสมอ" Mister Donut พร้อมเสิร์ฟความอร่อยที่หลากหลายและสร้างรอยยิ้มให้กับทุกคน',
      'openingHours': "เปิดทุกวัน จันทร์-ศุกร์ 10.00 - 21.30 น. ",
      'phoneNumber': "091-795-3839 ",
      'location': "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuImages': ['assets/imgs/mu15.jpg'],
      'promotion': ['assets/imgs/po15.jpg'],
      'type': 'ของทานเล่น/ขนม',
    },
    {
      'id': '16',
      'imageUrl': 'assets/imgs/im16.jpg',
      'ownerid': '1',
      'restaurantName': 'สุกี้ตี๋น้อย',
      'description': 'สุกี้ตี๋น้อย” บุฟเฟ่ต์ชาบูราคาหลักร้อยอร่อยไม่อั้น รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      บุฟเฟต์สุดคุ้มค่า ด้วยราคาที่ไม่แพง คุณสามารถทานได้ไม่อั้น ทั้งเนื้อหมูสไลด์บางๆ เนื้อวัวคุณภาพดี หมึก กุ้ง ลูกชิ้นหลากหลายชนิด และผักสดๆ นานาชนิด นอกจากนี้ยังมีเมนูทานเล่นอื่นๆ อีกมากมาย เช่น เกี๊ยวซ่า เฟรนช์ฟรายส์ และอีกหลากหลายรายการ',
      'openingHours': "เปิดทุกวัน 11:00 น. ถึง 04:00 น. ",
      'phoneNumber': "091-795-3839 ",
      'location': "ปากซอยลาดพร้าววังหิน 26 ถนนลาดพร้าววังหิน แขวง/เขตลาดพร้าว กรุงเทพฯ",
      'menuImages': ['assets/imgs/mu16.jpg'],
      'promotion': ['assets/imgs/po16.jpg'],
      'type': 'สุกี้/ชาบู',
    },
    {
      'id': '17',
      'imageUrl': 'assets/imgs/im17.jpg',
      'restaurantName': 'Yoguruto โยกุรุโตะ ',
      'ownerid': '1',
      'description': 'ร้านโยเกิร์ตสดปั่นสไตล์ญี่ปุ่น ที่กำลังได้รับความนิยมอย่างมากในกลุ่มคนรักสุขภาพและผู้ที่ชื่นชอบเครื่องดื่มสดชื่นชอบ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      โยเกิร์ตของ Yoguruto ทำจากโยเกิร์ตสด ทำให้ได้โปรไบโอติกธรรมชาติ ซึ่งดีต่อระบบขับถ่ายและช่วยเรื่องสุขภาพลำไส้ นอกจากนี้ยังสามารถเลือกปรับระดับความหวานได้ตามความต้องการ ทำให้เหมาะสำหรับผู้ที่ควบคุมน้ำตาล',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 24:00 น.",
      'phoneNumber': "088-662-8244",
      'location': "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuImages': ['assets/imgs/mu17.jpg'],
      'promotion': ['assets/imgs/po17.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '18',
      'imageUrl': 'assets/imgs/im18.jpg',
      'restaurantName': 'Swensen\'s',
      'ownerid': '3',
      'description': 'ร้านไอศกรีมและเค้กที่มีสาขาอยู่ทั่วประเทศไทย ด้วยรสชาติที่เป็นเลิศ เมนูที่หลากหลาย มีสินค้าใหม่มาให้ลิ้มลองตลอดปี พร้อมทั้งโปรโมชั่นมากมายให้ลูกค้าได้ชื่นใจไปกับสเวนเซ่น รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.0,
      'isOpen': false,
      'showMotorcycleIcon': true,
      'details': '      Swensen\'s ไม่ได้เป็นเพียงร้านไอศกรีม แต่เป็นที่ที่ผู้คนมาสร้างความทรงจำดีๆ ร่วมกัน ไม่ว่าจะในโอกาสพิเศษหรือในวันธรรมดาที่อยากเพิ่มความหวานให้กับชีวิต เติมเต็มความสุขด้วยความหวานเย็นชื่นใจ หรืออยากฉลองช่วงเวลาดีๆ กับคนพิเศษ ร้านไอศกรีมในตำนานที่อยู่คู่คนไทยมาอย่างยาวนาน ด้วยรสชาติที่เป็นเอกลักษณ์และหลากหลาย',
      'openingHours': "เปิดทุกวัน 10:00 น. ถึง 22:00 น. ",
      'phoneNumber': "091-795-3839 ",
      'location': "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuImages': ['assets/imgs/mu18.png'],
      'promotion': ['assets/imgs/po18.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '19',
      'imageUrl': 'assets/imgs/im19.jpg',
      'ownerid': '2',
      'restaurantName': 'ส้มตำนัว',
      'description': 'ร้านส้มตำนัวเป็นที่รู้จักกันดีในเรื่องของเมนูส้มตำและอาหารอีสานรสชาติจัดจ้านถึงเครื่อง รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 0.0,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      ที่นี่มีส้มตำหลากหลายเมนูให้เลือก ไม่ว่าจะเป็นส้มตำไทย ส้มตำปูปลาร้า ส้มตำคอหมูย่าง และอีกมากมาย ทุกจานปรุงรสชาติได้อย่างเข้มข้น จัดจ้าน เผ็ด เปรี้ยว หวาน เค็ม ครบรสตามแบบฉบับส้มตำนัว',
      'openingHours': "เปิดทุกวัน 11:00 น. ถึง 04:00 น. ",
      'phoneNumber': " 084-356-0080 ",
      'location': "เดอะมอลล์ไลฟ์สโตร์ บางแค ชั้น G แขวงบางแคเหนือ บางแคเหนือ กรุงเทพมหานคร 10160",
      'menuImages': ['assets/imgs/mu19.jpg'],
      'promotion': ['assets/imgs/po19.jpg'],
      'type': 'อาหารอีสาน',
    },
    {
      'id': '20',
      'imageUrl': 'assets/imgs/im20.jpg',
      'ownerid': '1',
      'restaurantName': 'ฉันจะกินชาเย็นทุกวัน ',
      'description': 'ทุกวันคือวันชาเย็น! พบกับความสดชื่นหลากหลายสไตล์ที่ BEAMS CHA รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ชาเย็นหลากหลายสไตล์ ที่นี่ไม่ได้มีแค่ชาเย็นแบบไทยๆ แต่ยังผสมผสานแนวคิดใหม่ๆ เพื่อให้ได้ชาเย็นรสชาติแปลกใหม่และน่าตื่นเต้น ไม่ว่าจะเป็นชาเย็นที่เบสด้วยชาเขียว ชาอู่หลง หรือชาดำ ผสมผสานกับส่วนผสมอื่นๆ ที่สร้างความแตกต่าง',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 22:30 น",
      'phoneNumber': "0000-0000-0000",
      'location': "ชั้น G ใน The Mall Lifestore Bangkae ใกล้กับ Gourmet Market และ EVEANDBOY",
      'menuImages': ['assets/imgs/mu20.jpg'],
      'promotion': ['assets/imgs/po20.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '21',
      'imageUrl': 'assets/imgs/im21.jpg',
      'ownerid': '2',
      'restaurantName': 'ผักฉ่ำคำหอม ',
      'description': 'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      Pasta AMA เป็นร้านอาหารอิตาเลียนที่เชี่ยวชาญด้านพาสต้าสดใหม่ ด้วยวัตถุดิบคุณภาพสูงและสูตรต้นตำรับ เมนูเด่นคือคาโบนาร่าที่เข้มข้น และเพสโต้ที่หอมกลิ่นใบโหระพาแท้ๆ บรรยากาศอบอุ่นเหมาะกับการมาทานกับครอบครัวหรือเพื่อนฝูง',
      'openingHours': "เปิดทุกวัน 08:00 น. ถึง 24:00 น.",
      'phoneNumber': "088-662-8244",
      'location': "503/3 ชั้น 1 ยิ้มแย้ม โฮสเทล ถ. เพชรบุรี \nแขวงถนนพญาไท เขตราชเทวี กรุงเทพมหานคร 10400",
      'menuImages': ['assets/imgs/mu21.jpg'],
      'promotion': ['assets/imgs/po21.jpg'],
      'type': 'อาหารเจ/มังสวิรัติ',
    },
    {
      'id': '22',
      'imageUrl': 'assets/imgs/im22.png',
      'ownerid': '3',
      'restaurantName': 'Saint Etoile by Yamazaki ',
      'description': 'ร้านขนมปังสำหรับทุกเพศทุกวัยพร้อมเสิร์ฟความอร่อยด้วยขนมปังอบสดใหม่ทุกวัน รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      เมนูหลากหลาย ตอบโจทย์ทุกคนไม่ว่าคุณจะชื่นชอบขนมปังประเภทไหน ที่นี่มีให้เลือกมากมาย ตั้งแต่ขนมปังแถวสำหรับทำแซนด์วิช, ขนมปังไส้ต่างๆ ที่มีทั้งคาวและหวาน (เช่น ไส้กรอก, หมูหยอง, ถั่วแดง, ครีม) ไปจนถึงเบเกอรี่สไตล์ญี่ปุ่นอย่างเมร่อนปัง (Melon Pan) หรือชีสเค้ก และพุดดิ้งต่างๆ',
      'openingHours': "เปิดทุกวันเวลา 10:00 - 22:00 น",
      'phoneNumber': "024-549-678",
      'location': " The Mall Lifestore",
      'menuImages': ['assets/imgs/mu22.jpg'],
      'promotion': ['assets/imgs/po22.jpg'],
      'type': 'ของทานเล่น/ขนม',
    },
    {
      'id': '23',
      'imageUrl': 'assets/imgs/im23.jpg',
      'ownerid': '2',
      'restaurantName': 'ข้าวเม่า-ข้าวฟ่าง ',
      'description': 'ป่าในจินตนาการกำลังรอคุณ ข้าวเม่า-ข้าวฟ่าง ร้านอาหารท่ามกลางธรรมชาติ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.5,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      ข้าวเม่า-ข้าวฟ่าง ป่าในจินตนาการ เป็นร้านอาหารที่โดดเด่นด้วยบรรยากาศธรรมชาติที่สวยงามราวกับหลุดเข้าไปในป่าเทพนิยาย ร้านเสิร์ฟอาหารไทยหลากหลายเมนู ทั้งอาหารพื้นเมืองเหนือและอาหารไทยทั่วไป รสชาติจัดจ้านถึงเครื่อง ปรุงอย่างพิถีพิถัน',
      'openingHours': "มื้อกลางวัน เวลา 11:00 - 15:00 น.มื้อเย็น เวลา 17:00 - 21:30 น. ",
      'phoneNumber': "063-665-5838",
      'location': "ถนนราชพฤกษ์ ตำบลหนองควาย อำเภอหางดง เชียงใหม่ 50230",
      'menuImages': ['assets/imgs/mu23.jpg'],
      'promotion': ['assets/imgs/po23.jpg'],
      'type': 'อาหารไทย',
    },
    {
      'id': '24',
      'imageUrl': 'assets/imgs/im24.jpg',
      'ownerid': '2',
      'restaurantName': 'บ้านม่วนม่วน (Baan Mon Muan)',
      'description': 'หลีกหนีความวุ่นวาย สู่ความสุขสงบที่บ้านม่อนม่วน ที่พักและร้านอาหารบนยอดเขา ที่จะทำให้ทุกวินาทีของคุณเป็น ม่วน สมชื่อ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.1,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      บ้านม่อนม่วน เป็นทั้งที่พักและร้านอาหารที่โดดเด่นด้วยทำเลที่ตั้งบนยอดเขาในอำเภอแม่ริม วพาโนรามา ที่กว้างไกลสุดลูกหูลูกตา คุณจะได้สัมผัสกับอากาศบริสุทธิ์และไอหมอกในยามเช้า บรรยากาศร่มรื่นไปด้วยต้นไม้เขียวขจี ส่วนของร้านอาหาร บ้านม่อนม่วนให้บริการอาหารที่หลากหลาย ทั้งอาหารไทยและอาหารพื้นเมือง รสชาติอร่อยถูกปาก ',
      'openingHours': "เปิดทุกวันเวลา เวลา 9:00 น. ถึง 19:00 น. ",
      'phoneNumber': "083-318-6444 ",
      'location': "175 ม.2 ต.โป่งแยง แม่ริม เชียงใหม่ (ก่อนถึงม่อนแจ่ม 1.5 กม.) ",
      'menuImages': ['assets/imgs/mu24.jpg'],
      'promotion': ['assets/imgs/po24.jpg'],
      'type': 'อาหารไทย , อาหารตามสั่ง',
    },
    {
      'id': '25',
      'imageUrl': 'assets/imgs/im25.jpg',
      'ownerid': '1',
      'restaurantName': 'บ.กุ้งเผา (Bo Kung Phao Restaurant)',
      'description': 'ป.กุ้งเผา: ความสดใหม่ส่งตรงจากฟาร์ม กุ้งตัวโต มันเยิ้ม อร่อยเข้มข้นถึงเครื่อง มื้อพิเศษที่ต้องมา รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.1,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ร้านอาหารทะเลชื่อดัง โดยเฉพาะเมนูกุ้งเผา ที่ได้รับความนิยมอย่างมากในหมู่คนรักอาหารทะเล กุ้งเผา ที่ขึ้นชื่อเรื่องความสด ตัวใหญ่ เนื้อแน่น มันเยิ้ม ย่างมาสุกกำลังดี นอกจากกุ้งเผาแล้ว ยังมีอาหารทะเลอื่นๆ ที่สดใหม่ให้เลือกหลากหลายและรสชาติอาหารที่อร่อย ',
      'openingHours': "เปิดทุกวันเวลา เวลา 11:00 - 22:00 น. ",
      'phoneNumber': "095-669-6594",
      'location': "81/16 ถนนสายเอเชีย แม่สอด จังหวัดตาก ",
      'menuImages': ['assets/imgs/mu25.jpg'],
      'promotion': ['assets/imgs/po25.jpg'],
      'type': 'อาหารทะเล',
    },
    {
      'id': '26',
      'imageUrl': 'assets/imgs/im26.jpg',
      'ownerid': '3',
      'restaurantName': 'เถียงนา Coffee and Bakery Farm ',
      'description': 'เถียงนา คาเฟ่และเบเกอรี่ที่มีเอกลักษณ์โดดเด่น ในบรรยากาศที่ใกล้ชิดธรรมชาติและกลิ่นอายชนบท รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.5,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ร้านอาหารทะเลชื่อดัง โดยเฉพาะเมนูกุ้งเผา ที่ได้รับความนิยมอย่างมากในหมู่คนรักอาหารทะเล กุ้งเผา ที่ขึ้นชื่อเรื่องความสด ตัวใหญ่ เนื้อแน่น มันเยิ้ม ย่างมาสุกกำลังดี นอกจากกุ้งเผาแล้ว ยังมีอาหารทะเลอื่นๆ ที่สดใหม่ให้เลือกหลากหลายและรสชาติอาหารที่อร่อยร้านเถียงนาคือการสร้างสรรค์บรรยากาศให้เหมือนคุณกำลังนั่งพักผ่อนอยู่กลางทุ่งนา มีมุมถ่ายรูปสวยๆ มากมาย ทั้งกระท่อมไม้ไผ่กลางทุ่งนา สะพานไม้ทอดยาวเหมาะกับการมานั่งชิลล์ จิบกาแฟ ชมวิวทิวทัศน์ชนบท และสัมผัสอากาศบริสุทธิ์ ',
      'openingHours': "เปิดทุกวันเวลา เวลา 8:00 น. - 18:00 น. ",
      'phoneNumber': "095-669-6594",
      'location': "27/28 ถ. พหลโยธิน ตำบลไม้งาม เมืองตาก 63000 ",
      'menuImages': ['assets/imgs/mu26.jpg'],
      'promotion': ['assets/imgs/po26.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '27',
      'imageUrl': 'assets/imgs/im27.jpg',
      'ownerid': '3',
      'restaurantName': 'Good House x Khao-soi ',
      'description': 'คาเฟ่สไตล์มินิมอลผสมผสานความเป็นโฮมมี่ อบอุ่นเหมือนได้กลับบ้าน โดยเฉพาะสไตล์การตกแต่งแบบเกาหลี รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.8,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ร้านนี้ได้รับการออกแบบมาอย่างพิถีพิถัน เน้นความเรียบง่ายแต่แฝงไว้ด้วยความน่ารักและความอบอุ่นมินิมอลผสมผสานกลิ่นอายความเป็นเกาหลี ทำให้เป็นอีกหนึ่งแลนด์มาร์กที่ไม่ควรพลาดเมื่อมาเยือนเมืองตากไม่ได้มีดีแค่บรรยากาศ แต่เรื่องอาหารและเครื่องดื่มก็ทำได้ดีไม่แพ้กัน  ',
      'openingHours': "เปิดทุกวันเวลา เวลา 8:00 น. - 16:00 น. ",
      'phoneNumber': "095-659-8928",
      'location': "ตำบลน้ำรึม เมืองตาก จังหวัดตาก 63000 (บริเวณใกล้กับโรงเรียนอนุบาลตาก และสี่แยกไฟแดงโรงพยาบาลตากสิน)  ",
      'menuImages': ['assets/imgs/mu27.jpg'],
      'promotion': ['assets/imgs/po27.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '28',
      'imageUrl': 'assets/imgs/im28.jpg',
      'ownerid': '3',
      'restaurantName': 'ปิงวิว สวนอาหาร & รีสอร์ท  ',
      'description': 'สวรรค์แห่งการพักผ่อนและรสชาติอาหารไทยริมแม่น้ำปิง รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.9,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      บรรยากาศริมแม่น้ำปิง ที่สามารถมองเห็นวิวทิวทัศน์อันสวยงามได้ตลอดทั้งวันมีโซนที่นั่งให้เลือกหลากหลาย ทั้งแบบกลางแจ้งริมน้ำ หรือในร่มที่ยังคงสัมผัสได้ถึงความร่มรื่น อาหารไทยหลากหลายเมนู เน้นรสชาติแบบไทยแท้ จัดจ้านถึงเครื่อง และใช้วัตถุดิบสดใหม่  ',
      'openingHours': "เปิดทุกวันเวลา เวลา 10:00 น. - 23:00 น. ",
      'phoneNumber': '080-044-1133',
      'location': "102 แม่ท้อ ตำบลแม่ท้อ เมืองตาก ตาก 63000",
      'menuImages': ['assets/imgs/mu28.jpg'],
      'promotion': ['assets/imgs/mu28.jpg'],
      'type': 'อาหารไทย',
    },
    {
      'id': '29',
      'imageUrl': 'assets/imgs/im29.jpg',
      'ownerid': '3',
      'restaurantName': 'เขียวขจี อาหารไทย ',
      'description': 'เขียวขจีอาหารไทย: สัมผัสรสชาติไทยแท้ จัดจ้านถึงใจ ในบรรยากาศสบายๆ ใกล้ชิดธรรมชาติ  รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 3.4,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ชื่อร้าน "เขียวขจี" สะท้อนถึงบรรยากาศของร้านได้เป็นอย่างดีค่ะ ร้านตกแต่งด้วยต้นไม้นานาพรรณ ให้ความรู้สึกร่มรื่น สบายตา เหมือนได้นั่งทานอาหารในสวนหรือในป่าเล็กๆนี่มีมุมให้เลือกนั่งหลากหลาย ทั้งในโซนห้องแอร์เย็นสบาย หรือโซนด้านนอกที่เปิดโล่งรับลมธรรมชาติ เขียวขจีอาหารไทยเน้นเมนูอาหารไทยรสชาติต้นตำรับที่จัดจ้านถึงเครื่อง ปรุงอย่างพิถีพิถัน ใช้วัตถุดิบสดใหม่ รสชาติถูกปากทั้งคนท้องถิ่นและนักท่องเที่ยว  ',
      'openingHours': "เปิดทุกวันเวลา เวลา 08:00 น. ถึง 17:00 น. ",
      'phoneNumber': "091-839-0454",
      'location': "30 ตำบลเชียงทอง วังเจ้า ตาก 63180  ",
      'menuImages': ['assets/imgs/mu29.jpg'],
      'promotion': ['assets/imgs/po29.jpg'],
      'type': 'อาหารไทย',
    },
    {
      'id': '30',
      'imageUrl': 'assets/imgs/im30.jpg',
      'ownerid': '3',
      'restaurantName': 'ก๋วยเตี๋ยวเรือโกเกี้ย  ',
      'description': 'ต้นตำรับความอร่อยกว่าครึ่งศตวรรษ... รสชาติที่คุณคิดถึง น้ำซุปเข้มข้น เส้นนุ่ม เครื่องแน่น! หนึ่งชามไม่เคยพอ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.8,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ก๋วยเตี๋ยวโกเกี๊ยก เป็นหนึ่งในร้านก๋วยเตี๋ยวขวัญใจของชาวตากและนักท่องเที่ยวที่ได้มาเยือน ด้วยชื่อเสียงที่สั่งสมมายาวนานกว่าหลายสิบปี ทำให้ร้านนี้เป็นหมุดหมายของคนที่ชื่นชอบก๋วยเตี๋ยวรสชาติต้นตำรับแท้ๆ  ',
      'openingHours': "เปิดเวลา 8:00 น. - 15:00 น. หยุดทุกวันจันทร์",
      'phoneNumber': "081-817 -115",
      'location': "4 1 ถนนมหาดไทยบำรุง ตำบล หนองหลวง เมืองตาก ตาก 63000 ",
      'menuImages': ['assets/imgs/mu30.jpg'],
      'promotion': ['assets/imgs/po30.jpg'],
      'type': 'ก๋วยเตี๋ยว',
    },
    {
      'id': '31',
      'imageUrl': 'assets/imgs/im31.jpg',
      'ownerid': '3',
      'restaurantName': 'Khao-Sō-i ข้าวโซอิ   ',
      'description': 'ร้านข้าวซอยเส้นสด ใครชอบทานข้าวซอยน้ำซุปเข้มข้น เส้นหนึบหนับ  รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.8,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      ข้าวโซอิ เป็นร้านข้าวซอยที่ค่อนข้างมีชื่อเสียงในเชียงใหม่ค่ะ โดยเฉพาะเรื่องข้าวซอยเส้นสดและวัตถุดิบพรีเมียม ถือเป็นร้านข้าวซอยสไตล์โมเดิร์นที่ปรับรสชาติและนำเสนอให้มีความร่วมสมัย ',
      'openingHours': "เปิดทุกวัน เวลา10:00 - 22:00 น.",
      'phoneNumber': "062-591-3791",
      'location': " 430 4 ถนน เจริญราษฎร์ ตำบล ฟ้าฮ่าม เมืองเชียงใหม่ เชียงใหม่ 50000 ",
      'menuImages': ['assets/imgs/mu30.jpg'],
      'promotion': ['assets/imgs/po30.jpg'],
      'type': 'ก๋วยเตี๋ยว, อาหารไทย',
    },
    {
      'id': '32',
      'imageUrl': 'assets/imgs/im32.jpg',
      'ownerid': '1',
      'restaurantName': 'Homie หมูกระทะ ',
      'description': 'คิดถึงหมูกระทะ คิดถึง Homie: ความอร่อยที่คุ้นเคย ในบรรยากาศที่ใช่ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 4.8,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ร้านตกแต่งในสไตล์ที่อบอุ่น มินิมอล มีความเกาหลีหน่อยๆ ทำให้รู้สึกสบายๆ เหมือนมานั่งกินข้าวที่บ้านเพื่อน หรือร้านคาเฟ่ เหมาะกับการมาสังสรรค์กับกลุ่มเพื่อนหรือครอบครัว ไม่ได้เป็นร้านหมูกระทะแบบโล่งๆ สด สะอาด และมีให้เลือกหลากหลาย ไม่ว่าจะเป็นหมูหมัก หมูสามชั้น เบคอน หรือซีฟู้ดก็มีให้เลือก',
      'openingHours': "เปิดทุกวัน เวลา 17.00 น. 22.00 น. ",
      'phoneNumber': "062-626-5661",
      'location': "231 ม.2 ต.หนองควาย หางดง จ.เชียงใหม่ ",
      'menuImages': ['assets/imgs/mu32.jpg'],
      'promotion': ['assets/imgs/po32.jpg'],
      'type': 'หมูกระทะ , สุกี้/ชาบู',
    },
    {
      'id': '33',
      'imageUrl': 'assets/imgs/im33.jpg',
      'ownerid': '2',
      'restaurantName': 'ร้านน้องโจ๊กกระบี่ ',
      'description': 'ร้านอาหารใต้พื้นบ้าน วัตถุดิบท้องถิ่น ในจังหวัดกระบี่ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      ร้านอาหารน้องโจ๊ก กระบี่ เป็นร้านอาหารใต้ดั้งเดิมและมีชื่อเสียงในจังหวัดกระบี่ เปิดมานานกว่า 40 ปี ร้านนี้ขึ้นชื่อเรื่องอาหารใต้รสชาติเข้มข้นถึงเครื่องแกง แต่รสชาติไม่จัดมาก ออกรสกลางๆ ทำให้ทานง่าย  มีการคัดสรรวัตถุดิบสดใหม่ โดยเฉพาะอาหารทะเลจากชาวเลท้องถิ่น',
      'openingHours': "เปิด 2 ช่วงเวลา เวลา11:00-14:00 น. และ 16:00-21:00 น.  ",
      'phoneNumber': "062-072-7887",
      'location': "50 3 ตำบล ไสไทย เมืองกระบี่ กระบี่ 81000 ",
      'menuImages': ['assets/imgs/mu33.jpg'],
      'promotion': ['assets/imgs/po33.jpg'],
      'type': 'อาหารใต้ , อาหารตามสั่ง',
    },
    {
      'id': '34',
      'imageUrl': 'assets/imgs/im34.jpg',
      'ownerid': '3',
      'restaurantName': 'ร้านอาหารกระบี่ เรือนทิพย์ ',
      'description': 'สัมผัสรสชาติอาหารไทยพื้นบ้านและอาหารทะเลสดใหม่ ริมคลองสน ที่คุณจะต้องประทับใจ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': true,
      'showMotorcycleIcon': false,
      'details': '      ร้านเรือนทิพย์ สาขาคลองสน เป็นร้านอาหารไทยพื้นเมืองและอาหารทะเลที่ขึ้นชื่อในกระบี่ เปิดให้บริการมานานกว่า 20 ปี ร้านนี้ขึ้นชื่อเรื่องอาหารพื้นเมืองรสจัดจ้านถึงเครื่องพริกแกง แต่ก็มีอาหารหลากหลายประเภทให้เลือกสั่ง ทั้งซีฟู้ดไทยและอาหารฝรั่ง สำหรับผู้ที่ทานเผ็ดไม่ได้',
      'openingHours': "เปิดทุกวัน เวลา 10.00 - 22.00 น. ",
      'phoneNumber': "075-656-222",
      'location': "ตำบล หนองทะเล เมืองกระบี่ กระบี่ 81000",
      'menuImages': ['assets/imgs/mu34.jpg'],
      'promotion': ['assets/imgs/po34.jpg'],
      'type': 'อาหารใต้ , อาหารทะเล  ',
    },
    {
      'id': '35',
      'imageUrl': 'assets/imgs/im35.jpg',
      'ownerid': '1',
      'restaurantName': 'See the Sea Restaurant ',
      'description': 'ร้านอาหารใต้พื้นบ้าน ติดทะเล ลูกค้าส่วนใหญ่เป็นนักท่องเที่ยวต่างชาติ อาหารราคาไม่แพงเมื่อเทียบกับปริมาณและรสชาติ รายละเอียดเพิ่มเติม คลิกได้เลย',
      'rating': 5.0,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      See the Sea Restaurant เป็นร้านอาหารซีฟู้ดและอาหารไทยที่ได้รับความนิยมในกระบี่ โดยเฉพาะอย่างยิ่งสำหรับผู้ที่มองหาร้านอาหารริมทะเลที่สามารถชมวิวพระอาทิตย์ตกได้ ร้านนี้มีที่นั่งทั้งโซนด้านนอกที่เห็นวิวทะเล และโซนห้องแอร์ด้านใน',
      'openingHours': "เปิด วันจันทร์ - วันอาทิตย์: 12:00 - 21:00 น. ",
      'phoneNumber': "080-537-3235",
      'location': "50 3 ตำบล ไสไทย เมืองกระบี่ กระบี่ 81000 ",
      'menuImages': ['assets/imgs/mu35.jpg'],
      'promotion': ['assets/imgs/po35.jpg'],
      'type': 'อาหารไทย , อาหารทะเล ',
    },
    {
      'id': '36',
      'imageUrl': 'assets/imgs/im36.jpg',
      'ownerid': '2',
      'restaurantName': 'C’More Mount Bar ',
      'description': 'คาเฟ่บรรยากาศอบอุ่นใจกลางเมืองกระบี่ เสิร์ฟกาแฟหอมกรุ่นและขนมหวานโฮมเมดหลากชนิด เหมาะสำหรับการนั่งพักผ่อนหรือทำงาน',
      'rating': 4.7,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      The Sweet Spot Cafe โดดเด่นด้วยการตกแต่งสไตล์มินิมอล มีมุมถ่ายรูปสวยๆ และขนมเค้ก เบเกอรี่อบสดใหม่ทุกวัน รวมถึงเครื่องดื่มพิเศษตามฤดูกาล',
      'openingHours': "เปิด วันอังคาร - วันอาทิตย์: 09:00 - 18:00 น. (ปิดวันจันทร์)",
      'phoneNumber': "098-765-4321",
      'location': "123 ถ.มหาราช ต.ปากน้ำ เมืองกระบี่ กระบี่ 81000",
      'menuImages': ['assets/imgs/mu36.jpg'],
      'promotion': ['assets/imgs/po36.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '37',
      'imageUrl': 'assets/imgs/im37.jpg',
      'ownerid': '2',
      'restaurantName': 'Urban café x workspace ',
      'description': 'คาเฟ่ขนมหวานในสวนสวย บรรยากาศร่มรื่น เหมาะสำหรับคนรักธรรมชาติและขนมไทยฟิวชั่น ไอศกรีมโฮมเมดหลากหลายรสชาติ',
      'rating': 4.9,
      'isOpen': true,
      'showMotorcycleIcon': true,
      'details': '      Krabi Dessert Garden นำเสนอเมนูขนมหวานที่ผสมผสานความเป็นไทยและความสมัยใหม่เข้าด้วยกัน ใช้วัตถุดิบคุณภาพดีจากท้องถิ่น มีเมนูเด่นคือบัวลอยลาวาและไอศกรีมมะพร้าว',
      'openingHours': "เปิด วันจันทร์ - วันอาทิตย์: 10:00 - 19:00 น.",
      'phoneNumber': "081-234-5678",
      'location': "45 หมู่ 3 ต.อ่าวนาง เมืองกระบี่ กระบี่ 81180",
      'menuImages': ['assets/imgs/mu37.jpg'],
      'promotion': ['assets/imgs/po37.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
    {
      'id': '38',
      'imageUrl': 'assets/imgs/im38.jpg',
      'ownerid': '3',
      'restaurantName': 'Sprucy Cafe ',
      'description': 'คาเฟ่สไตล์โมเดิร์น ชิกๆ ที่มีเมนูแพนเค้ก วาฟเฟิล และสมูทตี้โบวล์สุดสร้างสรรค์ เหมาะสำหรับสายถ่ายรูปและคนรักสุขภาพ',
      'rating': 4.5,
      'isOpen': false,
      'showMotorcycleIcon': false,
      'details': '      Chic & Sweet Krabi เน้นการตกแต่งที่ทันสมัยและเมนูที่เน้นความสวยงามและดีต่อสุขภาพ มีกาแฟ specialty และเครื่องดื่มที่ไม่เหมือนใคร.',
      'openingHours': "เปิด วันพุธ - วันจันทร์: 08:30 - 17:30 น. (ปิดวันอังคาร)",
      'phoneNumber': "061-987-6543",
      'location': "88/8 ถ.อุตรกิจ ต.ปากน้ำ เมืองกระบี่ กระบี่ 81000",
      'menuImages': ['assets/imgs/mu38.jpg'],
      'promotion': ['assets/imgs/po38.jpg'],
      'type': 'คาเฟ่/ของหวาน',
    },
  ];
  static Map<String, dynamic>? findRestaurantById(String id) {
    try {
      return restaurantList.firstWhere((restaurant) => restaurant['id'] == id);
    } catch (e) {
      return null;
    }
  }
}