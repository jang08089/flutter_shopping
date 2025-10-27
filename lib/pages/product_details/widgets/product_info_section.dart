import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_data.dart';

class ProductInfoSection extends StatelessWidget {
  ProductData productData = ProductData();
  ProductInfoSection({required this.productData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        // 상품명
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            productData.title,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            softWrap: true,
          ),
        ),
        SizedBox(height: 10),
        // 상품 가격
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '${productData.price}원',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        // 상품 설명
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            productData.content,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
