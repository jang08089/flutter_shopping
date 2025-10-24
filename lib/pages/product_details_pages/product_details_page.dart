import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details_pages/icons.dart';

class ProductDetailsPage extends StatelessWidget {
  String title = '갈색 암컷 푸들푸들푸들푸들푸들푸들푸들푸들푸들푸들푸들푸들푸들푸들푸들푸들';
  String content =
      '푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요,푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요푸들 13세 암컷 강아지입니다. 편식하고 산책 좋아해요';
  int price = 100000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/ahri.png',
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 60,
                  left: 5,
                  right: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        icon: CupertinoIcons.back,
                        onTap: () => Navigator.pop(context),
                        colorData: Colors.white70,
                      ),
                      CustomIconButton(
                        icon: CupertinoIcons.heart_fill,
                        onTap: () => print('찜하기 됨'),
                        colorData: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                softWrap: true,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '$price원',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                content,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
