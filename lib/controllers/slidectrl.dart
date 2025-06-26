import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../model/bannerslide.dart';

import '../views/details_ui.dart';
import 'detailctrl.dart'; // <--- แก้ไข: เปลี่ยนเป็น details_ui.dart

class SlideController extends GetxController {
  final List<BannerItem> originalBannerItems = [
    BannerItem(imagePath: 'assets/imgs/bn1.png', restaurantId: '1'), // ID ตรงกับ Reslist
    BannerItem(imagePath: 'assets/imgs/bn2.png', restaurantId: '2'),
    BannerItem(imagePath: 'assets/imgs/bn3.png', restaurantId: '3'),
    BannerItem(imagePath: 'assets/imgs/bn4.png', restaurantId: '4'),
    BannerItem(imagePath: 'assets/imgs/bn5.jpg', restaurantId: '5'),
    BannerItem(imagePath: 'assets/imgs/bn6.jpg', restaurantId: '6'),
    BannerItem(imagePath: 'assets/imgs/bn7.jpg', restaurantId: '7'),
    BannerItem(imagePath: 'assets/imgs/bn9.jpeg', restaurantId: '8'),
    
    // ตรวจสอบให้แน่ใจว่า ID ตรงกับ Reslist.restaurantList
  ];

  late final RxList<BannerItem> displayBannerItems;
  final RxInt currentPage = 0.obs;
  late PageController pageController;
  Timer? _timer;
  static const int _initialPageIndex = 1; // Index 1 คือรูปแรกของจริงใน displayBannerItems

  @override
  void onInit() {
    super.onInit();
    if (originalBannerItems.length < 2) {
      displayBannerItems = originalBannerItems.obs;
    } else {
      displayBannerItems = [
        originalBannerItems.last, // รูปสุดท้ายของจริง มาอยู่หน้าแรกสุด
        ...originalBannerItems, // รูปของจริงทั้งหมด
        originalBannerItems.first, // รูปแรกของจริง มาอยู่ท้ายสุด
      ].obs;
    }
    pageController = PageController(initialPage: _initialPageIndex);
    currentPage.value = _initialPageIndex;
  }

  @override
  void onReady() {
    super.onReady();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (displayBannerItems.length < 2) {
        return;
      }
      int targetPage;
      if (currentPage.value < displayBannerItems.length - 1) {
        targetPage = currentPage.value + 1;
      } else {
        // ถ้าอยู่หน้าสุดท้ายของ displayBannerItems (ซึ่งคือรูปแรกของจริง)
        targetPage = _initialPageIndex; // ให้กลับไปที่รูปแรกของจริง
      }

      if (pageController.hasClients) {
        if (targetPage == _initialPageIndex && currentPage.value == displayBannerItems.length - 1) {
          // ถ้ากำลังจะวนกลับไปรูปแรกของจริง
          pageController.jumpToPage(targetPage);
          currentPage.value = targetPage;
        } else {
          pageController.animateToPage(
            targetPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          ).then((_) {
            // อัปเดต currentPage หลังจาก animation จบ
            if (pageController.hasClients && pageController.page != null) {
              currentPage.value = pageController.page!.round();
            }
          });
        }
      }
    });
  }

  void onPageChanged(int page) {
    currentPage.value = page;
    if (page == 0 && displayBannerItems.length > 1) {
      // เมื่อเลื่อนไปที่หน้าปลอมแรก (ซึ่งเป็นรูปสุดท้ายของจริง) ให้ jump ไปหน้าสุดท้ายของจริง
      pageController.jumpToPage(originalBannerItems.length);
      currentPage.value = originalBannerItems.length;
    } else if (page == displayBannerItems.length - 1 && displayBannerItems.length > 1) {
      // เมื่อเลื่อนไปที่หน้าปลอมสุดท้าย (ซึ่งเป็นรูปแรกของจริง) ให้ jump ไปหน้าแรกของจริง
      pageController.jumpToPage(_initialPageIndex);
      currentPage.value = _initialPageIndex;
    }
    _startAutoScroll(); // รีสตาร์ท Timer หลังจากผู้ใช้เลื่อนเอง
  }

  // <--- แก้ไข: เมธอดสำหรับนำทางไปยังหน้ารายละเอียดร้านค้า
  void navigateToRestaurantDetail(String restaurantId) {
    // เปลี่ยนจาก Get.to(() => RestaurantDetailView()) เป็น Get.to(() => RestaurantDetailPageUi())
    // พร้อมใส่ binding เพื่อให้ RestaurantDetailController ถูก initialize ถูกต้อง
    Get.offAll(
      () => RestaurantDetailPageUi(
        restaurantId: restaurantId,
      ),
      binding: BindingsBuilder(() {
        // ต้องตรวจสอบให้แน่ใจว่า RestaurantDetailController รับ restaurantId ผ่าน constructor
        Get.put(RestaurantDetailController(restaurantId: restaurantId), tag: restaurantId);
      }),
    );
    
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}