import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/registerctrl.dart';

class ImprofileInsert extends StatelessWidget {
  const ImprofileInsert({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => controller.pickProfileImage(),
        child: Obx(
          () => CircleAvatar(
            radius: 44,
            backgroundColor: Colors.white.withValues(alpha: 8 * 0.1),
            backgroundImage:
                controller.selectedProfileImagePath.isNotEmpty &&
                    File(controller.selectedProfileImagePath).existsSync()
                ? FileImage(File(controller.selectedProfileImagePath))
                      as ImageProvider
                : const AssetImage(''),
            child: controller.selectedProfileImagePath.isEmpty
                ? Icon(Icons.camera_alt, size: 50, color: Colors.grey[600])
                : null,
          ),
        ),
      ),
    );
  }
}
