import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menuctrl.dart';

class Promotion extends StatelessWidget {
  const Promotion({super.key, required this.bannerImages});

  final List<String> bannerImages;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
         Text(
          "โปรโมชั่น:",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 20),

        
        bannerImages.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "ไม่มีโปรโมชั่นในขณะนี้",
                    style: GoogleFonts.kanit(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bannerImages.length,
                  itemBuilder: (context, index) {
                    final imageUrl = bannerImages[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox(
                          width: 300,
                          
                          child: DynamicImage(imageUrl: imageUrl),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ] 
      
    );
  }
}