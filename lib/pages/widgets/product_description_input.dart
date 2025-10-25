import 'package:flutter/material.dart';

class ProductDescriptionInput extends StatelessWidget {
  final void Function(String?) onSaved;

  const ProductDescriptionInput({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "상품 설명",
        border: OutlineInputBorder(),
      ),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      validator: (value) =>
          value == null || value.isEmpty ? "상품 설명을 입력해주세요" : null,
      onSaved: onSaved,
    );
  }
}
