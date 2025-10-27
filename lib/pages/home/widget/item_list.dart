import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;

  const FavoriteIcon({super.key, required this.isSelected, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        (isSelected) ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}

Widget itemList(
  String itemName,
  int price,
  bool isSelected, {
  String? imagePath = "",
}) {
  final formattPrice = NumberFormat("#,###").format(price);

  return Row(
    children: [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[300],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: (imagePath != null && imagePath.isNotEmpty)
              ? Image.asset(imagePath, fit: BoxFit.cover)
              : null,
        ),
      ),
      SizedBox(width: 15),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(itemName, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(
            '$formattPrice원',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Spacer(),
      FavoriteIcon(isSelected: isSelected, onTap: () {}),
      SizedBox(width: 15),
      Icon(Icons.shopping_cart_checkout),

      // 장바구니에 담는 기능 추가 예정
    ],
  );
}
