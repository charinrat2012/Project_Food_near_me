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
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios_new_outlined),
                                color: Colors.white.withValues(alpha: 8 * 0.05),
                              ),
                            ),
      ],
    );
  }
}