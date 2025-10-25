import 'package:flutter/material.dart';

class ProductPriceInput extends StatelessWidget {
  final void Function(String?) onSaved;

  const ProductPriceInput({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "상품 가격",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "상품 가격을 입력해주세요.",
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "상품 가격을 입력해주세요";
            }
            if (double.tryParse(value) == null) {
              return "숫자만 입력 가능합니다";
            }
            return null;
          },
          onSaved: onSaved,
        ),
      ],
    );
  }
}
