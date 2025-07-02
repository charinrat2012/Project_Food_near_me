import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/scrollctrl.dart';
import 'scrolltotop_bt.dart';

class BtScrollTop extends StatelessWidget {
  const BtScrollTop({super.key, required this.tag});
 final String tag;
  @override
  Widget build(BuildContext context) {
   final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>( tag: tag);
    return  Obx(
                () => scrollpageController.showScrollToTopButton.value
                    ? Positioned(
                        right: 20.0,
                        bottom: MediaQuery.of(context).padding.bottom + 16.0,
                        child: ScrollToTopButton(
                          onPressed: scrollpageController.scrollToTop,
                        ),
                      )
                    : Container(),
              );
  }
}