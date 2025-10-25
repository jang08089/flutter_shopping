import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details_pages/chat_page.dart';
import 'package:flutter_shopping/pages/product_details_pages/icons.dart';
import 'package:flutter_shopping/pages/product_details_pages/product_data.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductData productData = ProductData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 스크롤 가능한 영역
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/ahri.png',
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    productData.title,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${productData.price}원',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    productData.content,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),

          // 고정 아이콘 (항상 위에 보임)
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
                  colorData: Colors.grey,
                ),
                CustomIconButton(
                  icon: productData.isFavortie
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  onTap: () {
                    setState(() {
                      productData.isFavortie = !productData.isFavortie;
                    });
                    print('찜했음? : ${productData.isFavortie}');
                  },
                  colorData: productData.isFavortie
                      ? Colors.deepOrange
                      : Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(color: Colors.white10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: productData.isFavortie
                  ? CupertinoIcons.heart_fill
                  : CupertinoIcons.heart,
              onTap: () {
                setState(() {
                  productData.isFavortie = !productData.isFavortie;
                });
                print('찜했음? : ${productData.isFavortie}');
              },
              colorData: productData.isFavortie
                  ? Colors.deepOrange
                  : Colors.grey,
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
      ),
    );
  }
}
