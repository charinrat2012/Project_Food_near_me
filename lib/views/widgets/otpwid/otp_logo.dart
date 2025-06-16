import 'package:flutter/material.dart';

class OtpLogo extends StatelessWidget {
  const OtpLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return 
        Column(
          children: [
            // SizedBox(height: 8 *1),
            Image.asset('assets/imgs/otp.png', width: 200),
          //   SizedBox(height: 8 *2),
          ],
        );

  }
}
