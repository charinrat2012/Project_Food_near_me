import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/registerctrl.dart';
import 'package:food_near_me_app/widgets/matwid/back_bt.dart';
import 'package:food_near_me_app/widgets/matwid/backgoundlogin.dart';
import 'package:food_near_me_app/widgets/matwid/blurcontainer.dart';
import 'package:food_near_me_app/widgets/regiswid/register_bt.dart';
import 'package:food_near_me_app/widgets/regiswid/register_head.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/widgets/regiswid/form_register.dart';
import '../widgets/matwid/iconperson.dart';

class RegisterUi extends StatelessWidget {
  RegisterUi({super.key});

  final RegisterController controller = Get.find<RegisterController>();

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
                          Expanded(child: SizedBox()),
                          RegisterHead(),
                          Expanded(child: SizedBox()),
                          FormRegister(),
                          Expanded(child: SizedBox()),

                          RegisterBt(),
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
