import 'package:get/get.dart';
class ReviewController extends GetxController {
  final RxMap<String, List<Map<String, dynamic>>> _allReviews =
      <String, List<Map<String, dynamic>>>{}.obs;
  @override
  void onInit() {
    super.onInit();

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