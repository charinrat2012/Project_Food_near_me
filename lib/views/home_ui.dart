import 'package:flutter/material.dart';

import 'package:food_near_me_app/widgets/home_widget/home_show_card.dart';
import 'package:food_near_me_app/widgets/material_widget/bt_scrolltop.dart';
import 'package:get/get.dart';

import '../controllers/scrollctrl.dart';
import '../widgets/home_widget/home_location_FilterBar.dart';
import '../widgets/material_widget/search_bar_filter.dart';

import '../widgets/home_widget/home_slide_image.dart';

import '../widgets/material_widget/appbarA.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>(tag: 'home_scroll');
    // final FilterController filterController = Get.find<FilterController>();
    // final FilterController filterController = Get.find<FilterController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: const AppbarA(tag: 'home filter ctrl'),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[200]!, Colors.pink[200]!],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          controller: scrollpageController.scrollController,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SearchBarFilter(tag: 'home'),
                              const HomeLocationFilterbar(),
                              const SizedBox(height: 8),
                              HomeSlideImage(),
                              const SizedBox(height: 8),
                              ShowCardHome(),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BtScrollTop(tag: 'home_scroll'),
              // Obx(
              //   () => scrollpageController.showScrollToTopButton.value
              //       ? Positioned(
              //           right: 20.0,
              //           bottom: MediaQuery.of(context).padding.bottom + 16.0,
              //           child: ScrollToTopButton(
              //             onPressed: scrollpageController.scrollToTop,
              //           ),
              //         )
              //       : Container(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
