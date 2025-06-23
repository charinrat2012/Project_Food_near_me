import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/forgotpass_ui.dart';
import 'package:food_near_me_app/widgets/matwid/back_bt.dart';
import 'package:food_near_me_app/widgets/matwid/backgoundlogin.dart';
import 'package:food_near_me_app/widgets/matwid/blurcontainer.dart';
import 'package:food_near_me_app/widgets/otpwid/form_otp.dart';
import 'package:food_near_me_app/widgets/matwid/iconperson.dart';
import 'package:food_near_me_app/widgets/otpwid/otp_head.dart';
import 'package:food_near_me_app/widgets/otpwid/otp_logo.dart';
import '../widgets/otpwid/otp_bt.dart';
import 'navbar.dart';

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
                          Stack(children: [BackBt(srcp: () =>  ForgotPassUi(),), Iconperson()]),
                          OtpHead(),
                          FormOtp(),
                          // Expanded(child: SizedBox()),
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
