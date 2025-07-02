import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/login_ctrl.dart';
import 'package:food_near_me_app/views/navbar_ui.dart';
import 'package:food_near_me_app/widgets/material_widget/back_bt.dart';
import 'package:food_near_me_app/widgets/material_widget/backgoundlogin.dart';
import 'package:food_near_me_app/widgets/material_widget/blurcontainer.dart';
import 'package:food_near_me_app/widgets/login_widget/login_form.dart';
import 'package:food_near_me_app/widgets/login_widget/login_with_bt.dart';
import 'package:food_near_me_app/widgets/login_widget/login_path_bt.dart';
import 'package:food_near_me_app/widgets/login_widget/login_bt.dart';
import 'package:get/get.dart';

import '../widgets/material_widget/iconperson.dart';
import '../widgets/login_widget/login_head_text.dart';

class LoginUi extends StatelessWidget {
  LoginUi({super.key});

  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      

          child:Scaffold(
            backgroundColor: Colors.transparent,

            body: Stack(
              children: [
          Positioned.fill(child: Backgoundlogin()),
              Center(
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
                            Stack(children: [BackBt(srcp: () =>  Navbar(),), Iconperson()]),
                           
                            LoginHeadText(),
                           
                            LoginForm(),
                            LoginPathBt(),
                            LoginWithBt(),
                           
                            LoginBt(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
           
        ],
          ),
      ),
    );
  }
}
