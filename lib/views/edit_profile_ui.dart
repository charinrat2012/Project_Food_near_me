import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/edit_profile_widget/edpf_profile_insert.dart';
import 'package:food_near_me_app/widgets/edit_profile_widget/edpf_form_edit.dart';
import 'package:food_near_me_app/widgets/material_widget/appbarB.dart';
import 'package:get/get.dart';

import '../controllers/scrollctrl.dart';
import '../widgets/edit_profile_widget/edpf_cancel_bt.dart';
import '../widgets/edit_profile_widget/edpf_head_text.dart';
import '../widgets/edit_profile_widget/edpf_save_bt.dart';

import '../widgets/material_widget/bt_scrolltop.dart';

class EditProfileUi extends StatelessWidget {
  const EditProfileUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController = Get.put(
      ScrollpageController(),
      tag: 'edit_profile_scroll',
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppbarB(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink[200]!, Colors.blue[200]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  transform: GradientRotation(3.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink[200]!, Colors.blue[200]!],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        transform: GradientRotation(3.0),
                      ),
                    ),
                  ),
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
                        child: SingleChildScrollView(
                          controller: scrollpageController.scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 60),
                              EdpfHeadText(),
                              const SizedBox(height: 10),
                              EdpfFormEdit(),
                              const SizedBox(height: 70),
                              EdpfSaveBt(),
                              const SizedBox(height: 15),
                              EdpfCancelBt(),

                              // const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BtScrollTop(tag: 'edit_profile_scroll'),
            EditProfileInsert(),
          ],
        ),
      ),
    );
  }
}
