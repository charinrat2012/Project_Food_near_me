import 'package:flutter/material.dart';
class Formsearch extends StatelessWidget {
  const Formsearch({super.key});
  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search, color: Colors.grey[600]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
