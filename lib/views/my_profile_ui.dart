import 'package:flutter/material.dart';

import 'package:food_near_me_app/widgets/my_profile_widget/editprobt.dart';
import 'package:food_near_me_app/widgets/my_profile_widget/logoutbt.dart';
import 'package:food_near_me_app/widgets/my_profile_widget/profile_head.dart';
import 'package:food_near_me_app/widgets/my_profile_widget/profileimshow.dart';
import 'package:food_near_me_app/widgets/my_profile_widget/show_profile_detail.dart';

import '../widgets/material_widget/appbarB.dart';

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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 60),
                            ProfileHead(),

                            // SizedBox(height: 15)    ,
                            ShowProfileDetail(),

                            Expanded(child: SizedBox()),
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
