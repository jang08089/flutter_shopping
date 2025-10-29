import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:flutter_shopping/pages/itemcartpage/itemcart.dart';
import 'package:flutter_shopping/pages/mypage/mypage.dart';
import 'package:flutter_shopping/pages/product_details/widgets/icons.dart';

class ImageTopIcons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onCartToggle;
  final bool alreadyCart;

  const ImageTopIcons({
    required this.onBack,
    required this.onCartToggle,
    required this.alreadyCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CustomIconButton(
            icon: CupertinoIcons.back,
            onTap: onBack,
            colorData: Colors.lightBlue,
          ),
          Spacer(), // 왼쪽 back과 오른쪽 아이콘 사이 공간 확보
          Row(
            children: [
              // 마이페이지 이동 로직 비활성함
              // CustomIconButton(
              //   icon: Icons.person_2,
              //   colorData: Colors.lightBlue,
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Mypage()),
              //     );
              //   },
              // ),
              SizedBox(width: 10), // 아이콘 사이 간격
              CustomIconButton(
                icon: CupertinoIcons.bag_fill,
                colorData: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Itemcart()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
