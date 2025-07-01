// lib/controllers/myshopctrl.dart
import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/controllers/filterctrl.dart';
import '../model/restaurant.dart';

class MyShopController extends GetxController {
  final RxList<Restaurant> myOwnerShopList = <Restaurant>[].obs;

  late final LoginController _loginController;
  late final FilterController _filterController;

  @override
  void onInit() {
    super.onInit();
    _loginController = Get.find<LoginController>();
    _filterController = Get.find<FilterController>();

    // *** จุดแก้ไขที่ 1: เพิ่ม Listener ติดตามการเปลี่ยนแปลง ***
    // ever() จะทำงานทุกครั้งที่ allRestaurantsObservable ใน FilterController เปลี่ยนแปลง
    ever(_filterController.allRestaurantsObservable, (_) => filterMyShops());

    // ever() จะทำงานทุกครั้งที่ User ID เปลี่ยน (เช่น ตอน login/logout)
    ever(_loginController.userId, (_) => filterMyShops());

    // เรียก filterMyShops() ครั้งแรกเพื่อแสดงผล
    filterMyShops();
  }

  void filterMyShops() {
    if (_loginController.isLoggedIn.value &&
        _loginController.userId.value.isNotEmpty) {
      final String currentOwnerId = _loginController.userId.value;

      // กรองร้านค้าที่เป็นของเจ้าของปัจจุบันจาก list กลาง
      final filteredShops = _filterController.allRestaurantsObservable
          .where((restaurant) => restaurant.ownerId == currentOwnerId)
          .toList();

      myOwnerShopList.assignAll(filteredShops);
    } else {
      myOwnerShopList.clear();
    }
  }

  void toggleShopStatus(String shopId, bool newStatus) {
    final shopIndex = myOwnerShopList.indexWhere((shop) => shop.id == shopId);
    if (shopIndex != -1) {
      myOwnerShopList[shopIndex].isOpen.value = newStatus;
      _filterController.updateRestaurantStatus(shopId, newStatus);
    }
  }
}
