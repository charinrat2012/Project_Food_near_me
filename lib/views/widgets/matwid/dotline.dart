
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class Dotline extends StatelessWidget {
  final Color color; // เพิ่ม property 'color'
  final double height;
  final double dashWidth;
  final double dashSpace;

  const Dotline({
    Key? key,
    this.color = Colors.white, // ตั้งค่าเริ่มต้นเป็นสีเทา หรือสีที่คุณต้องการ
    this.height = 1.0,
    this.dashWidth = 5.0,
    this.dashSpace = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color), // ใช้ค่า 'color' ที่รับมา
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}