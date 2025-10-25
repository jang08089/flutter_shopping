import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final String? productName;
  final String? productPrice;
  final String? productDescription;
  final String? selectedImagePath;

  const SubmitButton({
    super.key,
    required this.formkey,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.selectedImagePath,
  });

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (selectedImagePath == null) {
            _showError(context, "이미지를 선택해주세요");
            return;
          }
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("등록 완료"),
                content: Text("상품이 성공적으로 등록되었습니다."),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("확인"),
                  ),
                ],
              ),
            );
          }
        },
        child: Text("등록하기"),
      ),
    );
  }
}
