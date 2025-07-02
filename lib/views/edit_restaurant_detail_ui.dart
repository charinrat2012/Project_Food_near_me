import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/edit_detail.widget/eddt_form_edit.dart';
import 'package:food_near_me_app/widgets/edit_detail.widget/eddt_head_text.dart';
import 'package:food_near_me_app/widgets/edit_detail.widget/eddt_save_bt.dart';
import 'package:get/get.dart';

import '../controllers/restaurant_edit_detail_ctrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/material_widget/back3_bt.dart';
import '../widgets/material_widget/bt_scrolltop.dart';

class EditRestaurantDetailsUi extends StatelessWidget {
  final String restaurantId;
  const EditRestaurantDetailsUi({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final EditRestaurantDetailsController editRestaurantController =
        Get.find<EditRestaurantDetailsController>(tag: restaurantId);
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>(
          tag: 'edit_details_scroll_$restaurantId',
        );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Align(alignment: Alignment.centerLeft, child: Back3Bt()),
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink[200]!, Colors.blue[200]!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                transform: const GradientRotation(3.0),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink[200]!, Colors.blue[200]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  transform: const GradientRotation(3.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink[200]!, Colors.blue[200]!],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        transform: const GradientRotation(3.0),
                      ),
                    ),
                  ),
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
                      child: Obx(() {
                        if (editRestaurantController.restaurantToEdit.value ==
                            null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final restaurant =
                            editRestaurantController.restaurantToEdit.value!;

                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            controller: scrollpageController.scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                EdDtHeadText(),
                                const SizedBox(height: 20),
                                EddtFormEdit(restaurantId: restaurantId),
                                const SizedBox(
                                  height: 100,
                                ), // เว้นที่สำหรับปุ่มด้านล่าง
                                // const SizedBox(height: 30),
                                EddtSaveBt(restaurantId: restaurantId),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            BtScrollTop(tag: 'editdetail_scroll'),
          ],
        ),
      ),
    );
  }
}
