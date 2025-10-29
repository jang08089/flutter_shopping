import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  ChatInputField({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return SafeArea(
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // 수직 가운데 정렬
          children: [
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                maxLines: 1,
                onSubmitted: (value) {
                  onSend();
                  controller.clear();
                  focusNode.requestFocus(); // 키보드 안내려가게 (연속 메시지 보내기 가능)
                },
                decoration: InputDecoration(
                  hintText: "메시지 보내기",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  //TextFild 내부 패딩 조절 (글자와 TextFild 사이의 패딩임)
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: GestureDetector(
                onTap: () {
                  onSend();
                  controller.clear();
                  focusNode.requestFocus(); // 키보드 안내려가게 (연속 메시지 보내기 가능)
                },
                child: Icon(
                  CupertinoIcons.arrow_up_circle_fill,
                  size: 40,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
