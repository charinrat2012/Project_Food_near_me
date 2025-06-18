import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoriteUi extends StatelessWidget {
  const FavoriteUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าโปรไฟล์'),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('ดูโปรไฟล์ของคุณที่นี่', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}