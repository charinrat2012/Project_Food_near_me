// lib/widgets/dynamic_image.dart

import 'dart:io';
import 'package:flutter/material.dart';

class DynamicImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const DynamicImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover, // กำหนดค่าเริ่มต้นให้ fit
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('assets/')) {
      // กรณีเป็นไฟล์ asset
      return Image.asset(
        imageUrl,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, color: Colors.grey),
      );
    } else if (File(imageUrl).existsSync()) {
      // กรณีเป็นไฟล์ในเครื่อง
      return Image.file(
        File(imageUrl),
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, color: Colors.grey),
      );
    } else if (imageUrl.startsWith('http')) {
      // กรณีเป็น URL จากอินเทอร์เน็ต
      return Image.network(
        imageUrl,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, color: Colors.grey),
      );
    }
    // กรณีเป็นข้อความ หรือหาไม่เจอ
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          imageUrl.isNotEmpty ? imageUrl : 'Invalid path',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}