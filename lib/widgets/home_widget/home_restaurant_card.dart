import 'package:flutter/material.dart';
import '../material_widget/star_rating.dart';
import '../material_widget/status_tag.dart';
class HomeRestaurantCard extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final String description;
  final double rating;
  final bool isOpen;
  final bool showMotorcycleIcon;
  final VoidCallback? onTap;
  const HomeRestaurantCard({
    super.key,
    required this.imageUrl,
    required this.restaurantName,
    required this.description,
    this.rating = 0.0,
    this.isOpen = false,
    this.showMotorcycleIcon = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),

      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),

          ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                   
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurantName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        description,
                        style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StarRating(
                            rating: rating,
                            size: 10,
                            onRatingChanged: (newRating) {},
                          ),
                          StatusTag(
                            isOpen: isOpen,
                            showMotorcycleIcon: showMotorcycleIcon,
                            fontSize: 12,
                          ),
                        ],
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
