// lib/views/details_ui.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Ensure paths to your widgets are correct
import 'widgets/matwid/back_bt.dart';
import 'widgets/matwid/dotline.dart';
import 'widgets/matwid/star_rating.dart';
import 'widgets/matwid/statustag.dart'; // Make sure this path is correct

class RestaurantDetailPage extends StatelessWidget {
  final String imageUrl; // URL or Asset Path for the main restaurant image
  final String restaurantName;
  final String description; // Retained, but not directly used in this layout
  final double rating; // Review score (1-5)
  final bool isOpen; // true if open, false if closed (not directly used in this layout)
  final bool showMotorcycleIcon; // true if motorcycle icon should be displayed
  final String details; // Changed back to 'detail' for consistency
  final String openingHours; // Opening hours variable
  final String phoneNumber; // Phone number variable
  final String location; // Location variable
  final String menuimage; // Menu image variable
  final String bannerImage; // Banner image variable

  const RestaurantDetailPage({
    super.key,
    required this.restaurantName,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.isOpen,
    required this.showMotorcycleIcon,
    required this.details, // Accepting 'detail'
    required this.openingHours, // Accepting 'openingHours'
    required this.phoneNumber, // Accepting 'phoneNumber'
    required this.location,
    required this.menuimage,
    required this.bannerImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: const Align(
            alignment: Alignment.centerLeft,
            child: BackBt(), // Using BackBt widget
          ),
          toolbarHeight: 8 * 12,
          automaticallyImplyLeading: false,
          actions: [
            Image.asset(
              "assets/imgs/logoHome.png",
              height: 8 * 10,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Dotline(
                  color: Colors.pink.shade200,
                  height: 4,
                  dashWidth: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Image.asset(
                    imageUrl, // **Using imageUrl received**
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Dotline(
                  color: Colors.pink.shade50,
                  height: 4,
                  dashWidth: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    height: 8 * 7,
                    color: Colors.pink.shade50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          restaurantName, // **Displaying restaurant name**
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8), // Spacing after restaurant name
                        StatusTag(
                          isOpen: isOpen,
                          showMotorcycleIcon: showMotorcycleIcon,
                          fontSize: 14,
                          showOpenStatus: false, // Set to false to hide open/closed status
                        ),
                      ],
                    ),
                  ),
                ),
                Dotline(
                  color: Colors.pink.shade50,
                  height: 4,
                  dashWidth: 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Restaurant details
                      Text(
                        details, // **Using detail received**
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 10.0),

                      // "เวลาเปิดร้าน" heading
                      Text(
                        "เวลาเปิดร้าน:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Text(
                        openingHours, // **Using openingHours received**
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 10.0),

                      // Phone number
                      Text(
                        "เบอร์โทร: $phoneNumber", // **Using phoneNumber received**
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 10.0),

                      // Location
                      Text(
                        "พิกัดที่ตั้ง: $location", // **Using location received**
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 15.0),

                      // Review rating
                      StarRating(rating: rating, size: 20), // Using StarRating widget
                      const SizedBox(height: 10.0),

                      // "เมนูแนะนำ:" heading
                      Text(
                        "เมนูแนะนำ:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      const SizedBox(height: 10.0),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image.asset(
                            menuimage, // **Using menuimage for recommended menu**
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "โปรโมชั่น:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          bannerImage, // **Using bannerImage for promotion banner**
                          height: 8 * 11,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}