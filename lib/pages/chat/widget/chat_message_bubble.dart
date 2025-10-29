import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  final String messages;
  final String sentTime;

  ChatMessageBubble({required this.messages, required this.sentTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // 채팅 말풍선
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Text(
            '${sentTime}',
            style: TextStyle(
              fontSize: 12,
              color: const Color.fromARGB(255, 113, 96, 96),
            ),
          ),
        ),
        // 채팅 말풍선 옆 보낸 시간 표시
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              messages,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
