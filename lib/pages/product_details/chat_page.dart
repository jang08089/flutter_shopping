import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_data.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ProductData productData = ProductData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true, // true값 할당
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                productData.imagePath,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${productData.price}원',
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // 가상 키보드 숨기기
          },

          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: Text(
                      '${sentTime()}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index],
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // 수직 가운데 정렬
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: 1,
                  onSubmitted: (value) {
                    if (value.trim().isEmpty) return;
                    setState(() {
                      messages.add(value);
                    });
                    controller.clear();
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
                    if (controller.text.trim().isEmpty) return;
                    setState(() {
                      messages.add(controller.text);
                    });
                    controller.clear();
                  },
                  child: Icon(
                    CupertinoIcons.arrow_up_circle_fill,
                    size: 40,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
