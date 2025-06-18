import 'package:get/get.dart';
class ReviewController extends GetxController {
  final RxMap<String, List<Map<String, dynamic>>> _allReviews =
      <String, List<Map<String, dynamic>>>{}.obs;
  @override
  void onInit() {
    super.onInit();
    _allReviews['pasta_ama_001'] = [
      {'user': 'อร่อยจริง', 'rating': 5.0, 'comment': 'พาสต้าอร่อยมากค่ะ แนะนำ!'},
      {'user': 'ลูกค้าประจำ', 'rating': 4.0, 'comment': 'ชอบคาโบนาร่าที่นี่มากค่ะ'},
    ];
    _allReviews['umenohana_002'] = [
      {'user': 'สายสุขภาพ', 'rating': 4.5, 'comment': 'เต้าหู้ดีงาม บรรยากาศเงียบสงบ'},
    ];
  }
  void addReview(String restaurantId, Map<String, dynamic> review) {
    _allReviews.update(restaurantId, (existingList) {
      existingList.add(review);
      return existingList;
    },
    ifAbsent: () => [review],
    );
  }
  List<Map<String, dynamic>> getReviewsForRestaurant(String restaurantId) {
    return _allReviews[restaurantId] ?? [];
  }
}