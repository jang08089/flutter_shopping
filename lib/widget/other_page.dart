// 이 파일은 별도의 파일 (예: pages/placeholder_pages.dart)에 저장하거나 
// HomePage.dart 파일의 맨 아래에 추가할 수 있습니다.

import 'package:flutter/material.dart';

// 상품 등록 페이지 (FloatingActionButton)
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상품 등록')),
      body: const Center(child: Text('상품 등록 페이지 (작업 예정)')),
    );
  }
}

// 상품 상세 페이지 (아이템 목록 클릭 시)
class DetailPage extends StatelessWidget {
  // 상세 페이지는 어떤 상품이 선택되었는지 정보를 받을 수 있도록 생성자에 인자를 추가했습니다.
  final String itemName;
  const DetailPage({super.key, required this.itemName}); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemName)),
      body: Center(child: Text('$itemName 상세 페이지 (작업 예정)')),
    );
  }
}

// 즐겨찾기 페이지 (AppBar favorite 아이콘)
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('즐겨찾기 목록')),
      body: const Center(child: Text('즐겨찾기 페이지 (작업 예정)')),
    );
  }
}

// 장바구니 페이지 (AppBar cart 아이콘)
class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      body: const Center(child: Text('장바구니 페이지 (작업 예정)')),
    );
  }
}