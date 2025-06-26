import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/views/aboutapp_ui.dart';
import 'package:food_near_me_app/views/contact_us_ui.dart';
import 'package:food_near_me_app/views/privacypolicy_ui.dart';
import 'package:food_near_me_app/views/terms_conditions_ui.dart';
import 'package:food_near_me_app/widgets/matwid/back_bt.dart';
import 'package:food_near_me_app/widgets/matwid/logo.dart';
import 'package:get/get.dart';

import 'navbar.dart';

class SettingUi extends StatelessWidget {
  SettingUi({super.key});
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackBt(srcp: () => const Navbar()),
        title: const Text('ตั้งค่า'),
        backgroundColor: Colors.blue[200],
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        toolbarHeight: 8 * 9,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[300]!, Colors.purple[100]!, Colors.blue[200]!],
            begin: Alignment.topCenter,
            transform: const GradientRotation(3.0),
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Get.offAll(PrivacyPolicyUi());
                     Get.to(PrivacyPolicyUi());
                    
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size.fromHeight(8 * 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'นโยบายความเป็นส่วนตัว',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    Get.to(TermsConditionsUi());
                    // Get.offAll(TermsConditionsUi());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size.fromHeight(8 * 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'เงื่อนไขและข้อตกลง',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    Get.to(AboutAppUi());
                    // Get.offAll(AboutAppUi());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size.fromHeight(8 * 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'เกี่ยวกับ ร้านอาหารใกล้ฉัน',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    Get.offAll(ContactUsUi());
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'ติดต่อเรา',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size.fromHeight(8 * 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                ),

                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 8 * 7,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Text(
                          'เวอร์ชั่น',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Spacer(),
                        Text(
                          ' 0.0.11',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),

                OutlinedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'แจ้งเตือน',
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("คุณแน่ใจหรือไม่ว่าต้องการลบบัญชี?"),
                          const SizedBox(height: 8 * 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    loginController.logout();
                                    Get.back();
                                  },
                                  child: const Text(
                                    "ยืนยัน",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    "ยกเลิก",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.grey[300],
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[50],
                    minimumSize: Size.fromHeight(8 * 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: Colors.pink[300]!),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text('ลบบัญชี', style: TextStyle(color: Colors.red)),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Logo(width: 250),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
