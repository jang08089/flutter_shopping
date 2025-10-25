import 'package:flutter/material.dart';

class ProductNameInput extends StatelessWidget {
  final void Function(String?) onSaved;

  const ProductNameInput({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "상품 이름",
        border: OutlineInputBorder(),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? "상품 이름을 입력해주세요" : null,
      onSaved: onSaved,
    );
  }
}
