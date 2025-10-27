import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/product_details/chat_page.dart';
import 'package:flutter_shopping/pages/product_details/widgets/icons.dart';
import 'package:flutter_shopping/pages/product_details/widgets/image_top_icons.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_data.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_bottom_sheet.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_image_section.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_info_section.dart';

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
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 130,
            ), // bottomSheet 높이만큼 (없으면 스크롤이 끝까지 안되므로)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageSection(
                  imagePath: productData.imagePath,
                  isFavorite: productData.isFavortie,
                  onFavoriteToggle: () {
                    setState(() {
                      productData.isFavortie = !productData.isFavortie;
                    });
                    print('찜했음? : ${productData.isFavortie}');
                  },
                ),
                ProductInfoSection(productData: productData),
              ],
            ),
          ),
          // 이미지 위 아이콘 올리기
          Positioned(
            top: 60,
            left: 5,
            right: 5,
            child: ImageTopIcons(
              isFavorite: productData.isFavortie,
              onBack: () {
                Navigator.pop(context);
              },
              onFavoriteToggle: () {
                setState(() {
                  productData.isFavortie = !productData.isFavortie;
                });
                print('찜했음? : ${productData.isFavortie}');
              },
            ),
          ),
        ],
      ),

      // bottomSeet 영역
      bottomSheet: ProductBottomSheet(
        isFavortie: productData.isFavortie,
        onFavoriteToggle: () {
          setState(() {
            productData.isFavortie = !productData.isFavortie;
          });
        },
        onChatTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()),
          );
        },
      ),
    );
  }
}
