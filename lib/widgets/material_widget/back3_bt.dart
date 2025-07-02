import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../views/navbar_ui.dart';
class Back3Bt extends StatelessWidget {
  const Back3Bt({super.key, });
 
   
   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              FocusScope.of(Get.context!).unfocus();
               if (Get.previousRoute.isNotEmpty) {
                  Get.back(); 
                } else if (Get.previousRoute.isEmpty) {
                  Get.offAll(() => Navbar()); 
                }else{
                  Get.offAll(() => Navbar());
                }
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