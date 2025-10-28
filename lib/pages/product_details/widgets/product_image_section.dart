import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImageSection extends StatelessWidget {
  final String imagePath;

  const ProductImageSection({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
