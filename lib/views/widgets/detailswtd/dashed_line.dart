import 'package:flutter/material.dart';
class DashedLine extends StatelessWidget {
  final double height; // ความสูงของแต่ละจุดประ
  final Color color; // สีของจุดประ
  final double dashWidth; // ความกว้างของแต่ละจุดประ
  final double dashSpace; // ช่องว่างระหว่างจุดประ
  const DashedLine({
    super.key,
    this.height = 3.0, // ความสูง
    this.color = const Color.fromARGB(255, 254, 252, 252), // ค่าเริ่มต้น
    this.dashWidth = 20.0, // ความยาว
    this.dashSpace = 10.0, // ความห่าง
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth(); // ดึงความกว้างที่มีอยู่
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor(); // จำนวนจุดประที่สามารถใส่ได้
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // กระจายจุดประให้ทั่ว
          direction: Axis.horizontal, // วางในแนวนอน
          children: List.generate(dashCount, (_) {
            // สร้างจุดประแต่ละจุด
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