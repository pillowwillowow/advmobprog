import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;

  const ImageCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}