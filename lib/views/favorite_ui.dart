import 'package:flutter/material.dart';
class FavoriteUi extends StatelessWidget {
  const FavoriteUi({super.key});
  @override
  Widget build(BuildContext context) {
    return Center( 
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.favorite, size: 100, color: Colors.red),
          SizedBox(height: 20),
          Text('ดูรายการโปรดของคุณที่นี่', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}