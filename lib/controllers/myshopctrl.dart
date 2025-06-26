// lib/controllers/myshopctrl.dart
import 'package:get/get.dart';
// import 'package:food_near_me_app/models/restaurant_model.dart';
import 'package:food_near_me_app/widgets/matwid/reslist.dart';
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

    ever(_loginController.userId, (_) => filterMyShops());
    
    filterMyShops();
  }

  void filterMyShops() {
    if (_loginController.isLoggedIn.value && _loginController.userId.value.isNotEmpty) {
      final String currentOwnerId = _loginController.userId.value;
      myOwnerShopList.assignAll(
        _filterController.allRestaurantsObservable // *** แก้ไขตรงนี้: ใช้ allRestaurantsObservable (ไม่มี _) ***
            .where((restaurant) => restaurant.ownerId == currentOwnerId)
            .toList(),
      );
    } else {
      myOwnerShopList.clear();
    }
  }

  void toggleShopStatus(String shopId, bool newStatus) {
    final shopIndex = myOwnerShopList.indexWhere((shop) => shop.id == shopId);
    if (shopIndex != -1) {
      // อัปเดตค่า isOpen ของ Restaurant object นั้น
      myOwnerShopList[shopIndex].isOpen.value = newStatus;
      
      // เรียกเมธอดใน FilterController เพื่ออัปเดตสถานะใน allRestaurantsObservable ของ FilterController
      _filterController.updateRestaurantStatus(shopId, newStatus); // *** แก้ไขตรงนี้: ใช้ updateRestaurantStatus ***
      
     
    }
  }
}