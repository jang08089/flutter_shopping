import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key}); // StatefulWidget 사용

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formkey = GlobalKey<FormState>(); // 위젯의 상태를 관리하는(저장 등) 변수선언

  String? _productName; // 상품 이름을 저장하는 변수
  String? _productPrice; // 상품 가격을 저장하는 변수
  String? _productDescription; // 상품 설명을 저장하는 변수
  String? _image; // 상품 이미지를 저장하는 변수

  bool _imageSelected = false; // 이미지 선택 여부 상태

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
