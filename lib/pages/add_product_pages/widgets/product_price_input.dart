import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ProductPriceInput extends StatefulWidget {
  final void Function(String?) onSaved;

  const ProductPriceInput({super.key, required this.onSaved});

  @override
  State<ProductPriceInput> createState() => _ProductPriceInputState();
}

class _ProductPriceInputState extends State<ProductPriceInput> {
  late TextEditingController _controller; // 입력값 관리용 컨트롤러
  final _formatter = NumberFormat("#,###"); // 천 단위 포맷

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  // 입력값 숫자만 추출 후 천 단위로 포맷
  String _formatNumber(String s) {
    String digits = s.replaceAll(RegExp(r"[^0-9]"), "");
    if (digits.isEmpty) return '';
    return _formatter.format(int.parse(digits));
  }

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
          controller: _controller, // 컨트롤러 연결
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // 숫자만 입력 가능
          ],
          decoration: InputDecoration(
            hintText: "상품 가격을 입력해주세요.",
            suffixText: "(원)", // 입력창 끝에 "(원)" 표시
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
            String digits = value?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
            if (digits.isEmpty) return "상품 가격을 입력해주세요";
            if (double.tryParse(digits) == null) return "숫자만 입력 가능합니다";
            return null;
          },

          // 입력할 때마다 천 단위 포맷 적용
          onChanged: (value) {
            String formatted = _formatNumber(value);
            _controller.value = TextEditingValue(
              text: formatted,
              selection: TextSelection.collapsed(offset: formatted.length),
            );
          },

          // 폼 저장 시 숫자만 상위 폼으로 전달
          onSaved: (value) {
            String digits = value?.replaceAll(RegExp(r"[^0-9]"), "") ?? "";
            widget.onSaved(digits);
          },
        ),
      ],
    );
  }
}
