import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterHead extends StatelessWidget {
  RegisterHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Register',
          style: GoogleFonts.charmonman(color: Colors.white70, fontSize: 40),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
