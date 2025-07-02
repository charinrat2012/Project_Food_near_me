import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_edit_ctrl.dart';
import '../../controllers/login_ctrl.dart';

class EditProfileInsert extends StatelessWidget {
  const EditProfileInsert({super.key});

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = 88.0; 
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double profileCircleSize = 100.0;
    final LoginController loginController = Get.find<LoginController>();
    final EditProfileController editController = Get.find<EditProfileController>();
    
    return  Positioned(
              left: 0,
              right: 0,
              top: statusBarHeight + appBarHeight - (profileCircleSize / 1.2),
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => editController.pickProfileImage(),
                  child: Obx(() => Container(
                    width: profileCircleSize,
                    height: profileCircleSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipOval(
                          child: editController.newProfileImagePath.isNotEmpty && File(editController.newProfileImagePath).existsSync() 
                              ? Image.file(
                                  File(editController.newProfileImagePath), 
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  loginController.userProfileImageUrl.value,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pink[400],
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                     
                    ),
                    
                  )
                  ),
                ),
              ),
            )    ;
  }
}