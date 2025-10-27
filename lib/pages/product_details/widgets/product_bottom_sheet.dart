import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details/chat_page.dart';
import 'package:flutter_shopping/pages/product_details/widgets/icons.dart';

class ProductBottomSheet extends StatelessWidget {
  bool isFavortie;
  VoidCallback onFavoriteToggle;
  VoidCallback onChatTap;

  ProductBottomSheet({
    required this.isFavortie,
    required this.onFavoriteToggle,
    required this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: isFavortie ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            onTap: onFavoriteToggle,
            colorData: isFavortie ? Colors.deepOrange : Colors.grey,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage()),
                );
              },

              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '채팅하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
