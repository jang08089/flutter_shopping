import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState>
  formkey; // 폼 안의(TextFormField 등) 값 검증, 저장, 초기화 등을 외부에서 제어 가능
  final VoidCallback onSubmit; // 버튼 클릭 시 실행할 동작을 부모 위젯에 전달

  const SubmitButton({
    super.key,
    required this.formkey,
    required this.onSubmit, //
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 스크롤 해도 화면 하단의 항상 고정하기(상품 등록 페이지에 명시) 위해 컨테이너 배치 후 버튼 배치
      padding: EdgeInsets.fromLTRB(16, 16, 16, 30),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onSubmit, // 버튼 눌렀을 때 실행될 함수 지정
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            "등록하기",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
