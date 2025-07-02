import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/editeprofile_ui.dart';

class Editprobt extends StatelessWidget {
  const Editprobt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => EditProfileUi());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink[400],
              padding: EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'แก้ไขข้อมูล',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
