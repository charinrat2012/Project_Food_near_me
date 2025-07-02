import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_ctrl.dart';
import '../../views/login_ui.dart';

class Logoutbt extends StatelessWidget {
  const Logoutbt({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    return Column(
      children: [
        TextButton(
          onPressed: () {
            loginController.logout();
            Get.offAll(() => LoginUi());
          },
          child: Text(
            'ออกจากระบบ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
