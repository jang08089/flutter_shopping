import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/chat/widget/Chat_input_field.dart';
import 'package:flutter_shopping/pages/chat/widget/chat_message_bubble.dart';
import 'package:flutter_shopping/pages/chat/widget/chat_product_info.dart';

class ChatPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String contents;
  final int price;

  // 이 페이지는 어떤 데이터를 가지고 있는지 보여준다
  ChatPage({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.contents,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<String> messages = [];

  // 보낸시간 계산
  String sentTime() {
    final now = DateTime.now();
    String formattedTime =
        "${now.hour >= 12 ? '오후' : '오전'} ${now.hour > 12 ? now.hour - 12 : now.hour}:${now.minute.toString().padLeft(2, '0')} ";
    return formattedTime; // ← 이 부분이 필요
  }

  void onSend() {
    if (controller.text.trim().isEmpty) return;
    setState(() {
      messages.add(controller.text);
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true, // true값 할당
      // 아니 왜 widget.imagePath (widget.)을 붙이는가 ? : “지금 이 State가 연결된 ChatPage 위젯이 가진 title 값”을 의미
      // StatefulWidget의 build()는 State 클래스 안에 있기 때문에, -> State(상태)가 바뀔때마다 build가 된다
      //Widget이 가진 데이터에 접근하려면 “widget.”을 통해 접근해야 한다.
      appBar: AppBar(
        titleSpacing: 0,
        title: ChatProductInfo(
          title: widget.title,
          imagePath: widget.imagePath,
          contents: widget.contents,
          price: widget.price,
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 100),
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        // body쪽 빈 화면을 누르면~
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // 가상 키보드 숨기기
          },

          child: ListView.builder(
            controller: scrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              // 채팅 말풍선 위젯
              return ChatMessageBubble(
                messages: messages[index],
                sentTime: sentTime(),
              );
            },
          ),
        ),
      ),
      bottomSheet: SafeArea(
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: ChatInputField(controller: controller, onSend: onSend),
        ),
      ),
    );
  }
}
