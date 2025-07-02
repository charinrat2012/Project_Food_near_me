
import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/register_ctrl.dart';

import 'package:food_near_me_app/widgets/material_widget/back3_bt.dart';

import 'package:food_near_me_app/widgets/material_widget/backgoundlogin.dart';
import 'package:food_near_me_app/widgets/material_widget/blurcontainer.dart';
import 'package:food_near_me_app/widgets/register_widget/register_image_profile_insert.dart';
import 'package:food_near_me_app/widgets/register_widget/register_bt.dart';
import 'package:food_near_me_app/widgets/register_widget/register_head_text.dart';
import 'package:get/get.dart';
import 'package:food_near_me_app/widgets/register_widget/register_form_edit.dart';


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
                    Blurcontainer(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.65,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Stack(children: [Back3Bt(),  RegisterImageProfileInsert() ]),

                          Expanded(child: SizedBox()),
                          RegisterHeadText(),
                          Expanded(child: SizedBox()),
                          RegisterFormEdit(),
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