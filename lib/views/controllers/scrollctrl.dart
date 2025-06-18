import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ScrollpageController extends GetxController {
  late ScrollController scrollController;
  final RxBool showScrollToTopButton = false.obs;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }
  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
  void _scrollListener() {
    if (scrollController.offset >= 200 && !showScrollToTopButton.value) {
      showScrollToTopButton.value = true; 
    }
    else if (scrollController.offset < 200 && showScrollToTopButton.value) {
      showScrollToTopButton.value = false;
    }
  }
  void scrollToTop() {
    scrollController.animateTo(
      0.0, // ตำแหน่งบนสุด
      duration: const Duration(milliseconds: 500), 
      curve: Curves.easeInOut, 
    );
  }
}