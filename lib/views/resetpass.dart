import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/widgets/matwid/back_bt.dart';
import 'package:food_near_me_app/views/widgets/matwid/backgoundlogin.dart';
import 'package:food_near_me_app/views/widgets/matwid/blurcontainer.dart';
import 'package:food_near_me_app/views/widgets/resetwid/from_reset.dart';
import 'package:food_near_me_app/views/widgets/matwid/iconperson.dart';
import 'package:food_near_me_app/views/widgets/resetwid/resetpass_bt.dart';
import 'package:food_near_me_app/views/widgets/resetwid/resetpass_head.dart';

class ResetpassUi extends StatelessWidget {
  const ResetpassUi({super.key});

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
                          ResetpassHead(),
                          FormReset(),
                          // SizedBox(height: 8*20),
                          Expanded(child: SizedBox()),
                          // Stack(children: [
                          //   Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          //     child: Image.asset('assets/imgs/robot.png', width: 300),
                          //   ),
                          //    Padding(
                          //      padding: const EdgeInsets.symmetric(horizontal: 17.0 , vertical: 16.0),
                          //      child: CustomCheckboxWidget(),
                          //    ),
                          // ]),
                          // SizedBox(height: 8*10),
                          ResetpassBt(),
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
