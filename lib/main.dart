import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/add_product_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(), // 홈페이지 라우트
        "/add-product": (context) => AddProductPage(), // 상품 등록 페이지 라우트
      },
      initialRoute: "/", // 앱 시작 시 첫 화면 = 홈페이지
    );
  }
}
