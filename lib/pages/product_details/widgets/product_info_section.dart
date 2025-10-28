import 'package:flutter/material.dart';

class ProductInfoSection extends StatelessWidget {
  final String name;
  final int price;
  final String contents;
  ProductInfoSection({
    required this.name,
    required this.price,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        // 상품명
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            name, // item에서 이름 사용
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            softWrap: true,
          ),
        ),
        SizedBox(height: 10),
        // 상품 가격
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '$price원', // item에서 가격 사용
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        // 상품 설명
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            contents ?? '상품 설명 없음', // item에서 설명 사용
            // '상품 설명 없음', // item에서 설명 사용
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
