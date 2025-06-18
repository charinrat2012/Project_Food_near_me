import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BackBt extends StatelessWidget {
  const BackBt({super.key});
   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              FocusScope.of(Get.context!).unfocus();
              Get.back();
            },
            icon: Image.asset( 
              "assets/ics/backicon.png", 
              width: 50.0, 
              height: 50.0, 
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}