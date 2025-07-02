import 'package:flutter/material.dart';

import 'package:food_near_me_app/widgets/forgot_password_widget/forgot_form_edit.dart';
import 'package:food_near_me_app/widgets/forgot_password_widget/mockup_robot_test.dart';
import 'package:food_near_me_app/widgets/material_widget/back3_bt.dart';
import 'package:get/get.dart';
import '../controllers/fogot_password_ctrl.dart';
import '../widgets/forgot_password_widget/forgot_head_text.dart';
import '../widgets/forgot_password_widget/forgot_sent_bt.dart';

import '../widgets/material_widget/backgoundlogin.dart';
import '../widgets/material_widget/blurcontainer.dart';

import '../widgets/material_widget/iconperson.dart';

class ForgotPasswordUi extends StatelessWidget {
  ForgotPasswordUi({super.key});
  final ForgotPasswordController controller = Get.find<ForgotPasswordController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Positioned.fill(child: Backgoundlogin()),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 8 * 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Blurcontainer(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.6,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Stack(children: [Back3Bt(), Iconperson()]),
                          ForgotHead(),
                          SizedBox(height: 5),
                          ForgotFormEdit(),
                          SizedBox(height: 8 * 3),
                          Mockrobot(),

                          Expanded(child: SizedBox()),
                          ForgotSentBt(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
