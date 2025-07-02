import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/views/editeprofile_ui.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:food_near_me_app/widgets/myprofilewid.dart/editprobt.dart';
import 'package:food_near_me_app/widgets/myprofilewid.dart/logoutbt.dart';
import 'package:food_near_me_app/widgets/myprofilewid.dart/profile_head.dart';
import 'package:food_near_me_app/widgets/myprofilewid.dart/profileimshow.dart';
import 'package:food_near_me_app/widgets/myprofilewid.dart/show_profile_detail.dart';
import 'dart:io';

import 'package:get/get.dart';

import '../controllers/scrollctrl.dart';
import '../widgets/matwid/appbarA.dart';
import '../widgets/matwid/appbarB.dart';
import '../widgets/matwid/back3_bt.dart';
import '../widgets/matwid/back_bt.dart';
import '../widgets/matwid/scrolltotop_bt.dart';
import 'navbar_ui.dart';

class MyprofileUi extends StatelessWidget {
  const MyprofileUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const AppbarB(),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[200]!, Colors.pink[200]!],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 50),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: SizedBox()),
                            ProfileHead(),
                            Expanded(child: SizedBox()),

                            ShowProfileDetail(),

                            SizedBox(height: 30),
                            Editprobt(),
                            SizedBox(height: 15),
                            Logoutbt(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Profileimshow(),
            ],
          ),
        ),
      ),
    );
  }
}
