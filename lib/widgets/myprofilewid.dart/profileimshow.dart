import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/loginctrl.dart';

class Profileimshow extends StatelessWidget {
  const Profileimshow({super.key});

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double profileCircleSize = 100.0;
    final LoginController loginController = Get.find<LoginController>();

    return Column(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: statusBarHeight + appBarHeight - (profileCircleSize / 1.2),
          child: Align(
            alignment: Alignment.center,
            child: Obx(
              () => Container(
                width: profileCircleSize,
                height: profileCircleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipOval(
                  child:
                      loginController.userProfileImageUrl.value.startsWith(
                        'assets/',
                      )
                      ? Image.asset(
                          loginController.userProfileImageUrl.value,
                          fit: BoxFit.cover,
                        )
                      : File(
                          loginController.userProfileImageUrl.value,
                        ).existsSync()
                      ? Image.file(
                          File(loginController.userProfileImageUrl.value),
                          fit: BoxFit.cover,
                        )
                      : Image.asset('assets/ics/person.png', fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
