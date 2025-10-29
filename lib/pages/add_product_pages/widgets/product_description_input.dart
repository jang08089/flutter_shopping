import 'package:flutter/material.dart';

class ProductDescriptionInput extends StatelessWidget {
  final void Function(String?) onSaved;

  const ProductDescriptionInput({super.key, required this.onSaved}); // 입력 값 저장

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // 화면 빈공간 터치시 키보드 내림
      behavior: HitTestBehavior.translucent, // 눈에 안보여도 이벤트 발생
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "상품 설명",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode
                .onUserInteraction, // 사용자가 입력하면 바로 검증 & 첫 화면 예외처리 방지
            minLines: 10, // 기본 10줄 보임
            maxLines: null, // 줄 바꿈 제한X
            keyboardType: TextInputType.multiline, // 줄바꿈 키보드 사용
            decoration: InputDecoration(
              hintText: "상품 설명을 입력해주세요.",
              border: OutlineInputBorder(), // 설명 입력칸 외곽선
              focusedBorder: OutlineInputBorder(
                // 입력칸 터치시 외곽선 기본 색에서 검은색으로 변경
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                // 외곽선 기본 색에서 회색으로 변경
                borderSide: BorderSide(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              // 상품 설명 입력 안할시 예외처리
              if (value == null || value.isEmpty) {
                return "상품 설명을 입력해주세요";
              }
              return null;
            },
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}
