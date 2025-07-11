import 'package:flutter/material.dart';
import 'package:food_near_me_app/controllers/reset_password_ctrl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ResetPasswordBt extends StatelessWidget {
  ResetPasswordBt({super.key});
  final ResetPasswordController controller = Get.find<ResetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ElevatedButton(
            onPressed: controller.fetchReset,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.pink.withValues(alpha: 8 * 0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Reset Password',
              style: GoogleFonts.charmonman(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
