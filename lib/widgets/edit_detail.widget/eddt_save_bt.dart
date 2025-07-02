import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/restaurant_edit_detail_ctrl.dart';

class EddtSaveBt extends StatelessWidget {
  final String restaurantId;
  const EddtSaveBt({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final EditRestaurantDetailsController editRestaurantController =
        Get.find<EditRestaurantDetailsController>(tag: restaurantId);
    return  SizedBox(
                                  width: double.infinity,
                                  child: Obx(() => ElevatedButton(
                                        onPressed: editRestaurantController
                                                .isLoading.value
                                            ? null
                                            : () => editRestaurantController
                                                .saveChanges(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pink[400],
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        child: editRestaurantController
                                                .isLoading.value
                                            ? const CircularProgressIndicator(
                                                color: Colors.white)
                                            : const Text(
                                                'บันทึกการเปลี่ยนแปลง',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                      )),
                                );
  }
}