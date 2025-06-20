import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ForgotHead extends StatelessWidget {
  const ForgotHead({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Forgot Password",
          style: GoogleFonts.charmonman(
            fontSize: 40,
            color: const Color.fromARGB(255, 224, 223, 223),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}