import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/widgets/matwid/backgoundlogin.dart';
import 'package:food_near_me_app/widgets/matwid/blurcontainer.dart';
import 'package:food_near_me_app/widgets/loginwid/form_login.dart';
import 'package:food_near_me_app/widgets/loginwid/login_with.dart';
import 'package:food_near_me_app/widgets/loginwid/path_bt.dart';
import 'package:food_near_me_app/widgets/loginwid/login_bt.dart';
import 'package:get/get.dart';
import '../widgets/loginwid/backhome_bt.dart';
import '../widgets/matwid/iconperson.dart';
import '../widgets/loginwid/login_head.dart';

class LoginUi extends StatelessWidget {
  LoginUi({super.key});

  final LoginController controller = Get.find<LoginController>();

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
                          Stack(children: [BackHomeBt(), Iconperson()]),
                          // SizedBox(height: 10),
                          LoginHead(),
                          // SizedBox(height: 10),
                          FormLogin(),
                          PathBt(),
                          LoginWith(),
                          // SizedBox(height: 8 * 2),
                          LoginBt(),
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
