import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/filterctrl.dart';
class Formsearch extends StatelessWidget {
  const Formsearch({super.key});
  @override
  Widget build(BuildContext context) {
     final FilterController filterController = Get.find<FilterController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8 * 2),
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withValues(alpha: 8 * 0.03),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
               controller: filterController.searchInputController,
              decoration: InputDecoration(
                hintText: 'ค้นหา...',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search, color: Colors.grey[600]),
              ),
               onSubmitted: (value) {
                
                filterController.filterRestaurantList(value);
                filterController.filterfavoriteList(value); 
                FocusScope.of(context).unfocus(); 
              },
              onChanged: (value) {
                 filterController.filterRestaurantList(value);
                filterController.filterfavoriteList(value); 
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
