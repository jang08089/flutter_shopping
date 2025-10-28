import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details/widgets/icons.dart';

class ImageTopIcons extends StatelessWidget {
  bool isFavorite;
  VoidCallback onBack;
  VoidCallback onFavoriteToggle;

  ImageTopIcons({
    required this.isFavorite,
    required this.onBack,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: CupertinoIcons.back,
          onTap: onBack,
          colorData: Colors.grey,
        ),
        CustomIconButton(
          icon: isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          onTap: onFavoriteToggle,
          colorData: isFavorite ? Colors.blue : Colors.grey,
        ),
      ],
    );
  }
}
