import 'package:flutter/material.dart';

class ProductNameInput extends StatefulWidget {
  final void Function(String?) onSaved;

  const ProductNameInput({super.key, required this.onSaved}); // description과 동일

  @override
  State<ProductNameInput> createState() => _ProductNameInputState();
}

class _ProductNameInputState extends State<ProductNameInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // 위 컨트롤러 사용시 위젯이 화면에서 사라질때 정리, 메모리 누수 방지, 앱 성능 안전하게 유지
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // 화면 빈공간 터치시 키보드 내림
      behavior: HitTestBehavior.translucent, // 눈에 안보여도 이벤트 발생
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "상품 이름",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            autovalidateMode:
                AutovalidateMode.onUserInteraction, // description과 동일
            decoration: InputDecoration(
              hintText: "상품 이름을 입력해주세요.",
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
              // description과 동일
              if (value == null || value.isEmpty) {
                return "상품 이름을 입력해주세요.";
              }
              return null;
            },
            onSaved: widget.onSaved,
          ),
        ],
      ),
    );
  }
}
