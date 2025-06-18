import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_near_me_app/views/controllers/loginctrl.dart';
class FormLogin extends StatelessWidget {
  FormLogin({super.key});
  final LoginController controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.1),
          child: TextField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Username or Email',
              hintStyle: GoogleFonts.charmonman(
                color: Colors.white.withValues(alpha: 8 * 0.07),
              ),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 8 * 0.03),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), 
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.1),
          child: Obx(
            () => TextField(
              controller: controller.passwordController,
              obscureText: controller.obscureText,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: GoogleFonts.charmonman(
                  color: Colors.white.withValues(alpha: 8 * 0.07),
                ),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 8 * 0.03),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    controller.obscureText = !controller.obscureText;
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  //กรอบช่อง
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
