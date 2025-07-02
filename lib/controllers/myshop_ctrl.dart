import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/login_ctrl.dart';
import 'package:food_near_me_app/controllers/filte_rctrl.dart';
import '../model/restaurant.dart';

class MyShopController extends GetxController {
  final RxList<Restaurant> myOwnerShopList = <Restaurant>[].obs;

  late final LoginController _loginController;
  late final FilterController _filterController;

  @override
  void onInit() {
    
    super.onInit();
    _loginController = Get.find<LoginController>();
    // ใช้ FilterController จาก tag ของหน้า Home ซึ่งเป็นแหล่งข้อมูลหลัก
   _filterController = Get.find<FilterController>();

    // ติดตามการเปลี่ยนแปลงของ allRestaurantsObservable และ userId เพื่อกรองร้านค้าของฉัน
    ever(_filterController.allRestaurantsObservable, (_) => filterMyShops());
    ever(_loginController.userId, (_) => filterMyShops());

    // เรียก filterMyShops() ครั้งแรกเพื่อแสดงผล
    filterMyShops();
  }

  void filterMyShops() {
    if (_loginController.isLoggedIn.value &&
        _loginController.userId.value.isNotEmpty) {
      final String currentOwnerId = _loginController.userId.value;

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