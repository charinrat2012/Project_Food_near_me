import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/checkctrl.dart';
import 'package:get/get.dart';

class CustomCheckboxWidget extends GetView<CheckboxController> {
  CustomCheckboxWidget({super.key}) {
    if (!Get.isRegistered<CheckboxController>()) {
      Get.put(CheckboxController());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: controller.isChecked.value,
                onChanged: controller.toggleCheckbox,
                activeColor: Colors.pink.shade300,
                checkColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
