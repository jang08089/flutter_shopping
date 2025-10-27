
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