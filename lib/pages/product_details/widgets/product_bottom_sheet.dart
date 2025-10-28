import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:flutter_shopping/pages/product_details/chat_page.dart';
import 'package:flutter_shopping/pages/product_details/widgets/icons.dart';

class ProductBottomSheet extends StatelessWidget {
  VoidCallback onCartToggle;
  final String name;
  final String imagePath;
  final int price;
  final String contents;
  final bool alreadyCart;

  ProductBottomSheet({
    required this.onCartToggle,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.contents,
    required this.alreadyCart,
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
            icon: Icons.shopping_cart_checkout,
            colorData: alreadyCart ? Colors.lightBlue : Colors.grey,
            //
            onTap: () {
              if (alreadyCart) {
                cartModel.removeItemCart(name);
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("제거 완료"),
                    content: Text("장바구니에서 제거되었습니다."),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("확인"),
                      ),
                    ],
                  ),
                );
              } else {
                print('장바구니에 있는 상품임? : $alreadyCart, false니까 추가 함,');
                cartModel.addItem(name, price, imagePath: imagePath);
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("추가 완료"),
                    content: Text("장바구니에 추가되었습니다."),
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
              onCartToggle();
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
