import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // 천 단위 포멧할 때 임포트 (패키지 다운로드 했음)

class ProductPriceInput extends StatefulWidget {
  final void Function(String?) onSaved;

  const ProductPriceInput({
    super.key,
    required this.onSaved,
  }); // // description과 동일

  @override
  State<ProductPriceInput> createState() => _ProductPriceInputState();
}

class _ProductPriceInputState extends State<ProductPriceInput> {
  late TextEditingController _controller; // 입력값 관리용 컨트롤러
  final _formatter = NumberFormat("#,###"); // 천 단위 포맷

  @override
  void initState() {
    // dispose와 비슷함 위젯이 처음 생성될 때 초기화
    super.initState();
    _controller = TextEditingController();
  }

  // 입력값 숫자만 추출 후 천 단위로 포맷
  String _formatNumber(String s) {
    String digits = s.replaceAll(
      RegExp(r"[^0-9]"),
      "",
    ); // 0~9중에 숫자가 아닌 모든 문자 제거 (숫자만 남음)
    if (digits.isEmpty) return ''; // 숫자가 없으면 빈 문자열 리턴
    return _formatter.format(int.parse(digits)); // 문자열을 int로 리턴
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // description과 동일
      behavior: HitTestBehavior.translucent, // description과 동일
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "상품 가격",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _controller, // 컨트롤러 연결
            keyboardType: TextInputType.number, // 숫자 키패드 사용
            autovalidateMode:
                AutovalidateMode.onUserInteraction, // description과 동일
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // 숫자만 입력 가능
            ],
            decoration: InputDecoration(
              hintText: "상품 가격을 입력해주세요.",
              suffixText: "(원)", // 입력창 끝에 "(원)" 표시
              border: OutlineInputBorder(), // description과 동일
              focusedBorder: OutlineInputBorder(
                // description과 동일
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                // description과 동일
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
      ),
    );
  }
}
