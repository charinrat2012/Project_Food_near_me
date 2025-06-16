import 'package:flutter/material.dart';
import 'dart:ui' as ui; // Import ui สำหรับ ImageFilter

class Blurcontainer extends StatelessWidget {
  final Widget child; // รับ Widget ลูกเข้ามา
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double blurSigmaX;
  final double blurSigmaY;
  final Color backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  const Blurcontainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.blurSigmaX = 30, // ค่าเริ่มต้นสำหรับ blur
    this.blurSigmaY = 30, // ค่าเริ่มต้นสำหรับ blur
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 0.01), // Colors.white.withValues(alpha: 8 * 0.01)
    this.borderRadius = const BorderRadius.all(Radius.circular(20)), // ค่าเริ่มต้นสำหรับ borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius!,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: blurSigmaY),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: child, // แสดง Widget ลูกที่รับเข้ามา
        ),
      ),
    );
  }
}