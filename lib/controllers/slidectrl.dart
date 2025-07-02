import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../model/bannerslide.dart';

import '../views/restaurant_details_ui.dart';
import 'restaurant_detail_ctrl.dart';

class SlideController extends GetxController {
  final List<BannerItem> originalBannerItems = [
    BannerItem(imagePath: 'assets/imgs/bn1.png', restaurantId: '1'),
    BannerItem(imagePath: 'assets/imgs/bn2.png', restaurantId: '2'),
    BannerItem(imagePath: 'assets/imgs/bn3.png', restaurantId: '3'),
    BannerItem(imagePath: 'assets/imgs/bn4.png', restaurantId: '4'),
    BannerItem(imagePath: 'assets/imgs/bn5.jpg', restaurantId: '5'),
    BannerItem(imagePath: 'assets/imgs/bn6.jpg', restaurantId: '6'),
    BannerItem(imagePath: 'assets/imgs/bn7.jpg', restaurantId: '7'),
    BannerItem(imagePath: 'assets/imgs/bn9.jpeg', restaurantId: '8'),
  ];

  late final RxList<BannerItem> displayBannerItems;
  final RxInt currentPage = 0.obs;
  late PageController pageController;
  Timer? _timer;
  static const int _initialPageIndex = 1;

  @override
  void onInit() {
    super.onInit();
    if (originalBannerItems.length < 2) {
      displayBannerItems = originalBannerItems.obs;
    } else {
      displayBannerItems = [
        originalBannerItems.last,
        ...originalBannerItems,
        originalBannerItems.first,
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
        targetPage = _initialPageIndex;
      }

      if (pageController.hasClients) {
        if (targetPage == _initialPageIndex &&
            currentPage.value == displayBannerItems.length - 1) {
          pageController.jumpToPage(targetPage);
          currentPage.value = targetPage;
        } else {
          pageController
              .animateToPage(
                targetPage,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              )
              .then((_) {
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
      pageController.jumpToPage(originalBannerItems.length);
      currentPage.value = originalBannerItems.length;
    } else if (page == displayBannerItems.length - 1 &&
        displayBannerItems.length > 1) {
      pageController.jumpToPage(_initialPageIndex);
      currentPage.value = _initialPageIndex;
    }
    _startAutoScroll();
  }

  void navigateToRestaurantDetail(String restaurantId) {
    Get.to(
      () => RestaurantDetailPageUi(restaurantId: restaurantId),
      binding: BindingsBuilder(() {
        Get.put(
          RestaurantDetailController(restaurantId: restaurantId),
          tag: restaurantId,
        );
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
