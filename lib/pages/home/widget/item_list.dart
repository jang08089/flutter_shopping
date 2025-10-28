import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';



Widget itemList(
  String itemName,
  int price,
 VoidCallback onDelete,
 VoidCallback onCartTap,
   {
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
      SizedBox(width: 15),
      Spacer(),
      GestureDetector(
        onTap: onCartTap,
        child: Icon(Icons.shopping_cart_checkout)),
        SizedBox(width: 15),
      GestureDetector(
        onTap: onDelete,
        child: Icon(Icons.delete))
      // 장바구니에 담는 기능 추가
    ],
  );
}
