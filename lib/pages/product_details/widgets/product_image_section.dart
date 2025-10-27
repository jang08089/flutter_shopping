import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details/widgets/icons.dart';

class ProductImageSection extends StatelessWidget {
  String imagePath;

  ProductImageSection({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        // Positioned(
        //   top: 60,
        //   left: 5,
        //   right: 5,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       CustomIconButton(
        //         icon: CupertinoIcons.back,
        //         onTap: onBack,
        //         colorData: Colors.grey,
        //       ),
        //       CustomIconButton(
        //         icon: isFavorite
        //             ? CupertinoIcons.heart_fill
        //             : CupertinoIcons.heart,
        //         onTap: onFavoriteToggle,
        //         colorData: isFavorite ? Colors.deepOrange : Colors.grey,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
