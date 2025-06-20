import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/forgotpass_ui.dart';
import 'package:food_near_me_app/views/register_ui.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_near_me_app/controllers/loginctrl.dart';

class PathBt extends StatelessWidget {
  PathBt({super.key});
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
                Get.to(ForgotPassUi());
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
