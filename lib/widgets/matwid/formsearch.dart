import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/filterctrl.dart';
class Formsearch extends StatelessWidget {
  
  const Formsearch({super.key,});
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
                  // gradient:  LinearGradient(colors: [Colors.blue.shade100, Colors.pink.shade100]),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 8 * 0.02), // Corrected alpha usage
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
               controller: filterController.searchInputController2,
               focusNode: filterController.searchFocusNode, // Assign the FocusNode here
              decoration: InputDecoration(
                hintText: 'ค้นหา...',
                border: InputBorder.none,
                suffixIcon: IconButton(icon:  Icon(Icons.search, color: Colors.grey[700],size: 18,), onPressed: () {
                  filterController.applyFilters();
                  filterController.clearSearchFocus(); // Clear focus on search button press
                },),
              ),
      
               onSubmitted: (value) {
                filterController.applyFilters();
                filterController.clearSearchFocus(); // Clear focus on submit
              },
              onTapOutside: (value) {
               filterController.clearSearchFocus(); // Clear focus on tap outside
              },
              autofocus: false,
              onChanged: (value) => {
                if (value.isEmpty) {
                  // filterController.clearSearchFocus() ,
                  filterController.applyFilters()
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}