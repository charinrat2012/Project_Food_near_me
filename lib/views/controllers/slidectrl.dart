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
    currentPage.value = _initialPageIndex; 
    print('PageController initialized at page: ${currentPage.value}');
  }
  @override
   void onReady() { 
    super.onReady();
    print('SlideController onReady called. Starting auto scroll now.');
    _startAutoScroll(); 
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
      } else {
        targetPage = _initialPageIndex;
        isJumpToFirstActualPage = true;
      }
        if (pageController.hasClients) {
          if (isJumpToFirstActualPage) {
            pageController.jumpToPage(targetPage);
            currentPage.value = targetPage;
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
                 }
              }
            });
          }
        } else {
           print('Timer: PageController has no clients when attempting to scroll.');
        }
    });
  }
  void onPageChanged(int page) {
    currentPage.value = page; 
    if (page == 0 && displayPizzaImages.length > 1) {
      pageController.jumpToPage(_lastActualPageIndex);
      currentPage.value = _lastActualPageIndex;
    } else if (page == displayPizzaImages.length - 1 && displayPizzaImages.length > 1) {
      pageController.jumpToPage(_initialPageIndex);
      currentPage.value = _initialPageIndex;
    }
    _startAutoScroll(); 
  }
  @override
  void onClose() {
    print('SlideController onClose called');
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}