import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductInfoSection extends StatelessWidget {
  final String title;
  final int price;
  final String contents;
  ProductInfoSection({
    required this.title,
    required this.price,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    // 금액 가독성을 위해 포맷
    final formattPrice = NumberFormat("#,###").format(price);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          // 상품명
          Text(
            title, // item에서 이름 사용
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            softWrap: true,
          ),
          SizedBox(height: 10),
          // 상품 가격
          Text(
            '$formattPrice원',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          // 상품 설명
          Text(
            contents,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
