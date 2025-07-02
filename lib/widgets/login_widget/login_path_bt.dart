import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/forgot_password_ui.dart';
import 'package:food_near_me_app/views/register_ui.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_near_me_app/controllers/login_ctrl.dart';

class LoginPathBt extends StatelessWidget {
  LoginPathBt({super.key});
  final LoginController controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                
                Get.to(RegisterUi());
              },
              child: Text(
                "Register",
                style: GoogleFonts.charmonman(
                  color: Colors.amber[200],
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                
                Get.to(ForgotPasswordUi());
              },
              child: Text(
                "Forgot password?",
                style: GoogleFonts.charmonman(
                  color: Colors.amber[200],
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
