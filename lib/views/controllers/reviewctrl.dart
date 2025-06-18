import 'package:get/get.dart';

class ReviewController extends GetxController {
  // *** ตรงนี้สำคัญมาก: ต้องเป็น RxMap และใช้ .obs เพื่อให้ reactive ***
  final RxMap<String, List<Map<String, dynamic>>> _allReviews =
      <String, List<Map<String, dynamic>>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // ถ้ามีรีวิวเริ่มต้นเยอะ ควรใส่ให้ครบทุกร้านที่มีใน HomeUi.restaurantList
    // เพื่อให้แน่ใจว่าไม่มีร้านใดที่ List ว่างไปเลย
    _allReviews['pasta_ama_001'] = [
      {'user': 'อร่อยจริง', 'rating': 5.0, 'comment': 'พาสต้าอร่อยมากค่ะ แนะนำ!'},
      {'user': 'ลูกค้าประจำ', 'rating': 4.0, 'comment': 'ชอบคาโบนาร่าที่นี่มากค่ะ'},
    ];
    _allReviews['umenohana_002'] = [
      {'user': 'สายสุขภาพ', 'rating': 4.5, 'comment': 'เต้าหู้ดีงาม บรรยากาศเงียบสงบ'},
    ];
    // เพิ่มรีวิวเริ่มต้นสำหรับร้านอื่นๆ ตามที่คุณต้องการ
    // ถ้าไม่มีรีวิวเริ่มต้นเลย ก็ไม่เป็นไร แค่ต้องเข้าใจว่า List จะว่างเปล่า
  }

  void addReview(String restaurantId, Map<String, dynamic> review) {
    // การเข้าถึง _allReviews[restaurantId]!.add(review) ต้องแน่ใจว่า key มีอยู่
    // ถ้า key ไม่มี จะเกิด error ได้หากไม่ตรวจสอบก่อน
    // การใช้ update() เป็นทางเลือกที่ดีกว่าสำหรับการเปลี่ยนแปลง Map/List ภายใน RxMap
    _allReviews.update(restaurantId, (existingList) {
      existingList.add(review);
      return existingList;
    },
    ifAbsent: () => [review], // ถ้าไม่มี key นี้เลย ให้สร้าง List ใหม่พร้อมรีวิวแรก
    );


  }

  // เมธอดสำหรับดึงรีวิวของร้านค้าที่ระบุ
  List<Map<String, dynamic>> getReviewsForRestaurant(String restaurantId) {
    // คืนค่า List ของรีวิวสำหรับ restaurantId นั้นๆ ถ้าไม่มี ให้คืนค่า List ว่าง
    return _allReviews[restaurantId] ?? [];
  }
}