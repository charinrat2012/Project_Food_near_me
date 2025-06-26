import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHead extends StatelessWidget {
  const LoginHead({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Login",
          style: GoogleFonts.charmonman(
            fontSize: 40,
            color: Colors.white,
           
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
