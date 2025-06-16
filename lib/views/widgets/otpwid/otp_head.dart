import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpHead extends StatelessWidget {
  const OtpHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Enter OTP",
          style: GoogleFonts.charmonman(
            fontSize: 40,
            color: const Color.fromARGB(255, 224, 223, 223),
            // fontWeight: FontWeight.bold, ทำให้ตัวหนังหนา
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
