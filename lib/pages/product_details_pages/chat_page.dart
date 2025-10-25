import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details_pages/product_data.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ProductData productData = ProductData();

  String getShortTitle(String title) {
    const maxLength = 10; // 제목이 너무 길 경우 자를 길이
    if (title.length > maxLength) {
      return '${title.substring(0, maxLength)}... 상품 문의 채팅';
    } else {
      return '$title 상품 문의 채팅';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getShortTitle(productData.title),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: const Center(child: Text('This is the chat page.')),
    );
  }
}
