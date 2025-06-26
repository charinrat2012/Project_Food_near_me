import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';
import 'package:food_near_me_app/views/editeprofile_ui.dart';

import 'package:food_near_me_app/views/navbar.dart';
import 'package:get/get.dart';

import '../controllers/scrollctrl.dart';
import '../widgets/matwid/back3_bt.dart';
import '../widgets/matwid/back_bt.dart';
import '../widgets/matwid/scrolltotop_bt.dart';

class MyprofileUi extends StatelessWidget {
  const MyprofileUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double profileCircleSize = 100.0;
    final LoginController loginController = Get.find<LoginController>();

   
   
   final ScrollpageController scrollpageController =
        Get.put(ScrollpageController(), tag: 'myprofile_scroll');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
       
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Align(
            alignment: Alignment.centerLeft,
            child: Back3Bt(),
          ),
          toolbarHeight: 8 * 10,
          automaticallyImplyLeading: false,
          actions: [
            Image.asset(
              "assets/imgs/logoHome.png",
              height: 8 * 10,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
          ],

          flexibleSpace: Container(
           
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink[200]!,
                  Colors.blue[200]!,
                ],
                begin: Alignment.centerLeft,
                transform: GradientRotation(3.0),
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
           
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink[200]!,
                    Colors.blue[200]!,
                  ],
                  begin: Alignment.centerLeft,
                  transform: GradientRotation(3.0),
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
               
                children: [
                 
                  Container(
                    height:
                        50.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.pink[200]!,
                          Colors.blue[200]!,
                        ],
                        begin: Alignment.centerLeft,
                        transform: GradientRotation(3.0),
                        end: Alignment.centerRight,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           
                            Expanded(child: SizedBox()),
                            Text(
                              'โปรไฟล์',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 10),
                           
                            _buildTextFieldWithLabel(
                              'ชื่อเล่น',
                              loginController.userName.value,
                              false,
                            ),
                            _buildTextFieldWithLabel(
                              'เบอร์โทรศัพท์',
                             loginController.userPhoneNumber.value,
                              false,
                            ),
                            _buildTextFieldWithLabel(
                              'อีเมล',
                              loginController.userEmail.value,
                              false,
                            ),
                            _buildTextFieldWithLabel(
                              'รหัสผ่าน',
                              loginController.userPassword.value,
                              true,
                            ),

                            SizedBox(height: 30),
                           
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                 
                                  // Get.offAll(() => EditProfileUi());
                                  Get.to(() => EditProfileUi());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.pink[400],
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  'แก้ไขข้อมูล',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                           
                            TextButton(
                              onPressed: () {
                                Get.offAll(() => Navbar());
                               

                               
                              },
                              child: Text(
                                'ออกจากระบบ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  decoration:
                                      TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

           
            Positioned(
              left: 0,
              right: 0,
             
              top: statusBarHeight + appBarHeight - (profileCircleSize / 1.2),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: profileCircleSize,
                  height: profileCircleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      loginController.userProfileImageUrl.value,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

           
            Obx(
              () => scrollpageController.showScrollToTopButton.value
                  ? Positioned(
                      right: 20.0,
                      bottom: MediaQuery.of(context).padding.bottom + 16.0,
                      child: ScrollToTopButton(
                        onPressed: scrollpageController.scrollToTop,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildTextFieldWithLabel(String label, String hint, bool isObscure) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
            ),
            obscureText: isObscure,
            readOnly: true,
           
          ),
        ],
      ),
    );
  }
}
