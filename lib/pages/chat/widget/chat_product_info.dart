import 'package:flutter/material.dart';

class ChatProductInfo extends StatelessWidget {
  final String title;
  final String imagePath;
  final String contents;
  final int price;

  ChatProductInfo({
    required this.title,
    required this.imagePath,
    required this.contents,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          //자식요소 모서리 둥글게 잘라주는 위젯
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
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
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                contents,
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${price}원',
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 30), // 상품 명과 내용이 길어지면 오른쪽 끝까지 가는데 그것을 방지
      ],
    );
  }
}
