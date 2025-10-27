import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final VoidCallback onSubmit;

  const SubmitButton({
    super.key,
    required this.formkey,
    required this.onSubmit, // 🔹 onSubmit 콜백으로 변경
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 30),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onSubmit, // 🔹 AddProductPage 상태를 직접 읽도록
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
