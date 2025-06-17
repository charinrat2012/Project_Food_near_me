// lib/views/widgets/status_tag.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Make sure to import GoogleFonts if you're using it

class StatusTag extends StatelessWidget {
  final bool isOpen;
  final bool showMotorcycleIcon;
  final double fontSize; // Parameter for font size
  final bool showOpenStatus; // **New parameter to control "OPEN/CLOSE" text visibility**

  const StatusTag({
    super.key,
    required this.isOpen,
    this.showMotorcycleIcon = false,
    this.fontSize = 12, // Default value as used in RestaurantCard
    this.showOpenStatus = true, // **Default to true, so existing uses still show status**
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showMotorcycleIcon) // **Show motorcycle icon always if showMotorcycleIcon is true**
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.two_wheeler, // Motorcycle icon
              size: 8 * 3, // Adjust size as appropriate
              color: Colors.orangeAccent,
            ),
          ),
        
        if (showOpenStatus) // **Conditionally show the "OPEN/CLOSE" container**
          Container(
            width: 8 * 9,
            height: 8 * 3,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isOpen
                  ? const Color.fromARGB(255, 255, 204, 229) // Background color OPEN (light pink)
                  : const Color.fromARGB(255, 255, 204, 229), // Background color CLOSE (light pink)
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: isOpen
                    ? const Color.fromARGB(255, 255, 153, 204) // Border color OPEN (darker pink)
                    : const Color.fromARGB(255, 255, 153, 204), // Border color CLOSE (darker pink)
                width: 1.0,
              ),
            ),
            child: Text(
              isOpen ? 'OPEN' : 'CLOSE',
              style: GoogleFonts.nosifer(
                color: isOpen
                    ? const Color.fromARGB(255, 255, 255, 255) // Text color OPEN (white)
                    : const Color.fromARGB(255, 255, 255, 255), // Text color CLOSE (white)
                fontWeight: FontWeight.bold,
                fontSize: fontSize, // Use the provided fontSize
              ),
            ),
          ),
      ],
    );
  }
}