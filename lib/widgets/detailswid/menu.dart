import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



import 'menuctrl.dart'; 

class Menu extends StatelessWidget {
  
  final List<String> menuImages;
 

  const Menu({
    super.key,
    required this.menuImages,

  });

  @override
  Widget build(BuildContext context) {
    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(
          "เมนูแนะนำ:",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 10.0),

        
        menuImages.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "ไม่มีเมนูแนะนำ",
                    style: GoogleFonts.kanit(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : Container(
                height: 8*50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menuImages.length,
                  itemBuilder: (context, index) {
                    final imageUrl = menuImages[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: SizedBox(
                          // width: 200,
                          
                          child: DynamicImage(imageUrl: imageUrl),
                        ),
                      ),
                    );
                  },
                ),
              ),

        const SizedBox(height: 20),
      
      ],
    );
  }
}