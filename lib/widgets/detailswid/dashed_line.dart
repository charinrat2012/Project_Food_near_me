import 'package:flutter/material.dart';
class DashedLine extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;
  const DashedLine({
    super.key,
    this.height = 3.0,
    this.color = Colors.white,
    this.dashWidth = 20.0,
    this.dashSpace = 10.0,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
           
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}