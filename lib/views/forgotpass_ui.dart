import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/widgets/forgotwid/form_forgot.dart';
import 'package:get/get.dart';
import 'controllers/fogotpassctrl.dart';
import 'widgets/forgotwid/forgot_head.dart';
import 'widgets/forgotwid/sent_bt.dart';
import 'widgets/matwid/back_bt.dart';
import 'widgets/matwid/backgoundlogin.dart';
import 'widgets/matwid/blurcontainer.dart';
import 'widgets/matwid/checkbox.dart';
import 'widgets/matwid/iconperson.dart';

class ForgotPassUi extends StatelessWidget {
  ForgotPassUi({super.key});
  // final ForgotpassController controller = Get.put(ForgotpassController());
  final ForgotpassController controller = Get.find<ForgotpassController>();
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
                          Stack(children: [BackBt(), Iconperson()]),
                          ForgotHead(),
                          SizedBox(height: 5),
                          FormForgot(),

                          SizedBox(height: 8 * 3),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Image.asset(
                                  'assets/imgs/robot.png',
                                  width: 300,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15.0,
                                ),
                                child: CustomCheckboxWidget(),
                              ),
                            ],
                          ),
                          // SizedBox(height: 8*16),
                          Expanded(child: SizedBox()),
                          SentBt(),
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
