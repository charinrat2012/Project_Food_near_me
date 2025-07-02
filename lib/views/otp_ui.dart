import 'package:flutter/material.dart';

import 'package:food_near_me_app/widgets/material_widget/back3_bt.dart';

import 'package:food_near_me_app/widgets/material_widget/backgoundlogin.dart';
import 'package:food_near_me_app/widgets/material_widget/blurcontainer.dart';
import 'package:food_near_me_app/widgets/otp_widget/otp_form_edit.dart';
import 'package:food_near_me_app/widgets/material_widget/iconperson.dart';
import 'package:food_near_me_app/widgets/otp_widget/otp_head_text.dart';
import 'package:food_near_me_app/widgets/otp_widget/otp_logo.dart';
import '../widgets/otp_widget/otp_bt.dart';


class OtpUi extends StatelessWidget {
  const OtpUi({super.key});

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
                          OtpHeadText(),
                          OtpFormEdit(),

                          Expanded(child: SizedBox()),
                          OtpLogo(),
                          Expanded(child: SizedBox()),
                          OtpBt(),
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
