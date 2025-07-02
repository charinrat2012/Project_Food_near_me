import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/material_widget/bt_scrolltop.dart';

import 'package:get/get.dart';

import '../controllers/scrollctrl.dart';

import '../widgets/material_widget/appbarA.dart';
import '../widgets/my_shop_widget/my_shop_show_card.dart';

class MyshopUi extends StatelessWidget {
  const MyshopUi({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>(tag: 'myshop_scroll');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: const AppbarA(tag: 'myshop filter ctrl'),
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
                          child: Showshopcard(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BtScrollTop(tag: 'myshop_scroll'),
            ],
          ),
        ),
      ),
    );
  }
}
