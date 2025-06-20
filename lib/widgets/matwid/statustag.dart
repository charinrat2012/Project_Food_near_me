import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusTag extends StatelessWidget {
  final bool isOpen;
  final bool showMotorcycleIcon;
  final double fontSize;
  final bool showOpenStatus;
  final double iconSize;
  const StatusTag({
    super.key,
    required this.isOpen,
    this.showMotorcycleIcon = false,
    this.fontSize = 12,
    this.iconSize = 24,
    this.showOpenStatus = true,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showMotorcycleIcon)
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Row(
              children: [
                Icon(
                  Icons.delivery_dining,
                  size: iconSize,
                  color: Colors.green,
                ),
                Text(
                  'Has Delivery',
                  style: GoogleFonts.charmonman(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ))
              ],
            ),
          ),
        if (showOpenStatus)
          Container(
            width: 8 * 9,
            height: 8 * 3,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isOpen
                  ? const Color.fromARGB(255, 255, 204, 229)
                  : const Color.fromARGB(255, 255, 204, 229),
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: isOpen
                    ? const Color.fromARGB(255, 255, 153, 204)
                    : const Color.fromARGB(255, 255, 153, 204),
              ),
            ),
            child: Text(
              isOpen ? 'OPEN' : 'CLOSE',
              style: GoogleFonts.nosifer(
                color: isOpen
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
      ],
    );
  }
}
