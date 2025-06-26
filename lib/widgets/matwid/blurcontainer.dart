import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Blurcontainer extends StatelessWidget {
  final Widget child;
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
    this.blurSigmaX = 30,
    this.blurSigmaY = 30,
    this.backgroundColor = const Color.fromARGB(96, 97, 47, 114),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
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
            // gradient: LinearGradient(colors: [Colors.pink.withValues(alpha: 0.2)!, Colors.blue.withValues(alpha: 0.2)!]),
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
