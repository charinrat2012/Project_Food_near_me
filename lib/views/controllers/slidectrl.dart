// lib/controllers/slide_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SlideController extends GetxController {
  final List<String> originalPizzaImages = [
    'assets/imgs/bn1.png',
    'assets/imgs/bn2.png',
    'assets/imgs/bn3.png',
    'assets/imgs/bn4.png',
    'assets/imgs/bn5.jpg',
    'assets/imgs/bn6.jpg',
    'assets/imgs/bn7.jpg',
    
  ];

  late final RxList<String> displayPizzaImages;
  final RxInt currentPage = 0.obs;

  late PageController pageController;
  Timer? _timer;

  static const int _initialPageIndex = 1;
  int get _lastActualPageIndex => originalPizzaImages.length;

  @override
  void onInit() {
    super.onInit();
    print('SlideController onInit called');
    if (originalPizzaImages.length < 2) {
      displayPizzaImages = originalPizzaImages.obs;
      print('Less than 2 images, no looping setup.');
    } else {
      displayPizzaImages = [
        originalPizzaImages.last,
        ...originalPizzaImages,
        originalPizzaImages.first,
      ].obs;
      print('Display images for looping: ${displayPizzaImages.length} items');
    }

    pageController = PageController(initialPage: _initialPageIndex);
    currentPage.value = _initialPageIndex; // ตั้งค่าเริ่มต้นให้ตรง
    print('PageController initialized at page: ${currentPage.value}');
  }

  @override
  void onReady() { // <--- ใช้ onReady() ของ GetX
    super.onReady();
    print('SlideController onReady called. Starting auto scroll now.');
    _startAutoScroll(); // เริ่ม Timer เมื่อ Widget พร้อมใช้งาน
  }

  void _startAutoScroll() {
    print('Starting auto scroll timer...');
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (displayPizzaImages.length < 2) {
        print('Timer: Not enough images to scroll.');
        return;
      }

      int targetPage;
      bool isJumpToFirstActualPage = false;

      if (currentPage.value < displayPizzaImages.length - 1) {
        targetPage = currentPage.value + 1;
        // print('Timer: Moving to next page: $targetPage from ${currentPage.value}');
      } else {
        targetPage = _initialPageIndex;
        isJumpToFirstActualPage = true;
        // print('Timer: Reached end, preparing to jump to first actual page ($targetPage)');
      }

      // No need for addPostFrameCallback here usually, as onReady ensures it's ready.
      // But adding a slight delay for animateToPage can sometimes help with timing.
      // Future.delayed(Duration(milliseconds: 10), () {
        if (pageController.hasClients) {
          if (isJumpToFirstActualPage) {
            pageController.jumpToPage(targetPage);
            currentPage.value = targetPage;
            // print('Timer: JUMPED to page: $targetPage (first actual)');
          } else {
            pageController.animateToPage(
              targetPage,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            ).then((_) {
              if (pageController.hasClients && pageController.page != null) {
                 final int pageAfterAnimation = pageController.page!.round();
                 if (currentPage.value != pageAfterAnimation) {
                     currentPage.value = pageAfterAnimation;
                     // print('Timer: Animated to page: ${currentPage.value}');
                 }
              }
            });
          }
        } else {
           print('Timer: PageController has no clients when attempting to scroll.');
        }
      // }); // Optional: uncomment if you still have timing issues
    });
  }

  void onPageChanged(int page) {
    // print('onPageChanged triggered by user to page: $page');
    currentPage.value = page; // อัปเดต currentPage ของ Controller ทันที

    // จัดการการวนซ้ำเมื่อผู้ใช้เลื่อนถึงขอบ
    if (page == 0 && displayPizzaImages.length > 1) {
      // print('onPageChanged: User scrolled to beginning duplicate, jumping to actual last page.');
      pageController.jumpToPage(_lastActualPageIndex);
      currentPage.value = _lastActualPageIndex;
    } else if (page == displayPizzaImages.length - 1 && displayPizzaImages.length > 1) {
      // print('onPageChanged: User scrolled to end duplicate, jumping to actual first page.');
      pageController.jumpToPage(_initialPageIndex);
      currentPage.value = _initialPageIndex;
    }

    _startAutoScroll(); // รีสตาร์ท Timer
  }

  @override
  void onClose() {
    print('SlideController onClose called');
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}