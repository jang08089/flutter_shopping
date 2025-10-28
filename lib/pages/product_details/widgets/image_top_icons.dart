import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:flutter_shopping/pages/itemcartpage/itemcart.dart';
import 'package:flutter_shopping/pages/mypage/mypage.dart';
import 'package:flutter_shopping/pages/product_details/widgets/icons.dart';
import 'package:flutter_shopping/pages/profile_editpage/profile.dart';

class ImageTopIcons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onCartToggle;
  final String name;
  final String imagePath;
  final int price;
  final bool alreadyCart;
  final Profile? profile;

  const ImageTopIcons({
    required this.onBack,
    required this.onCartToggle,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.alreadyCart,
    this.profile
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: CupertinoIcons.back,
          onTap: onBack,
          colorData: Colors.grey,
        ),
        Spacer(), // 왼쪽 back과 오른쪽 아이콘 사이 공간 확보
        Row(
          children: [
            CustomIconButton(
              icon: Icons.person_2,
              colorData: Colors.lightBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mypage(profile)),
                );
              },
            ),
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
    );
  }
}
