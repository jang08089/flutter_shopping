import 'package:flutter/material.dart';

class ProductPriceInput extends StatelessWidget {
  final void Function(String?) onSaved;

  const ProductPriceInput({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "상품가격",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) return "상품 가격을 입력해주세요";
        if (double.tryParse(value) == null) return "숫자만 입력 가능합니다";
        return null;
      },
      onSaved: onSaved,
    );
  }
}
