import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/favourite_widget/show_favourite_card.dart';
import 'package:food_near_me_app/widgets/material_widget/bt_scrolltop.dart';
import 'package:get/get.dart';

import 'package:food_near_me_app/controllers/scrollctrl.dart';
import 'package:food_near_me_app/widgets/material_widget/search_bar_filter.dart';

import 'package:food_near_me_app/widgets/material_widget/appbarA.dart';




class FavoriteUi extends StatelessWidget {
  const FavoriteUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController = Get.find<ScrollpageController>(tag: 'favorite_scroll');
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: const AppbarA(tag: 'favorite filter ctrl',),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue[200]!,
              Colors.pink[200]!,
            ]),
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
                               SearchBarFilter(tag:'favorite'),
                              const SizedBox(height: 8),

                              ShowFavouriteCard(),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             BtScrollTop(tag: 'favorite_scroll'),
            ],
          ),
        ),
      ),
    );
  }
}