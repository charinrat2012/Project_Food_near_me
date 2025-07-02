import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/register_ctrl.dart';
class RegisterBt extends StatelessWidget {
  RegisterBt({super.key});
  final RegisterController controller = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ElevatedButton(
            onPressed: controller.fetchRegister,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.pink.withValues(alpha: 8 * 0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Register',
              style: GoogleFonts.charmonman(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
