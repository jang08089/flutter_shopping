import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:flutter_shopping/pages/chat/chat_page.dart';
import 'package:flutter_shopping/pages/product_details/widgets/icons.dart';

class ProductBottomSheet extends StatelessWidget {
  VoidCallback onCartToggle; // 장바구니 넣기
  final String name; // 상품 이름
  final String imagePath; // 상품 이미지 경로
  final int price; // 상품 가격
  final String contents; // 상품 설명
  final bool alreadyCart; // 상품 장바구니 여부

  ProductBottomSheet({
    required this.onCartToggle,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.contents,
    required this.alreadyCart,
  });

  void _showDialog(BuildContext context, String logTitle, String logMessage) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(logTitle),
        content: Text(logMessage),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(),
            child: Text("확인"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
      width: double.infinity, // 최대로
      height: 120,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icons.shopping_cart_checkout,
            colorData: alreadyCart ? Colors.lightBlue : Colors.grey,
            //
            onTap: () {
              if (alreadyCart) {
                cartModel.removeItemCart(name);
                _showDialog(context, '제거 완료', '장바구니에서 해당 상품을 제거 합니다.');
              } else {
                print('장바구니에 있는 상품임? : $alreadyCart, false니까 추가 함,');
                cartModel.addItem(name, price, imagePath: imagePath);
                _showDialog(context, '추가 완료', '장바구니에서 해당 상품을 추가 합니다.');
              }
              onCartToggle(); // 장바구니 여부 갱신
            },
            //
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      imagePath: imagePath,
                      name: name,
                      price: price,
                      contents: contents,
                    ),
                  ),
                );
              },

              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
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
