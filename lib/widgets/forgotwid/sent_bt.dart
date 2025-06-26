import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/fogotpassctrl.dart';
class SentBt extends StatelessWidget {
  SentBt({super.key});
  final ForgotpassController controller = Get.find<ForgotpassController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ElevatedButton(
            onPressed: () {
              controller.fetchfogotpass();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.pink.withValues(alpha: 8 * 0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Sent',
              style: GoogleFonts.charmonman(
                fontSize: 24,
                color: Colors.white,
               
              ),
            ),
          ),
        ),
      ],
    );
  }
}
