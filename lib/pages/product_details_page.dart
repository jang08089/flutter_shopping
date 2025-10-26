import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/widgets/productDetailsPage/chat_page.dart';
import 'package:flutter_shopping/pages/widgets/productDetailsPage/icons.dart';
import 'package:flutter_shopping/pages/widgets/productDetailsPage/product_data.dart';
import 'package:flutter_shopping/pages/widgets/productDetailsPage/product_bottom_sheet.dart';
import 'package:flutter_shopping/pages/widgets/productDetailsPage/product_image_section.dart';
import 'package:flutter_shopping/pages/widgets/productDetailsPage/product_info_section.dart';

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
                // 사진, 사진 위 아이콘 영역
                ProductImageSection(
                  imagePath: productData.imagePath,
                  isFavorite: productData.isFavortie,
                  onBack: () {
                    Navigator.pop(context); //뒤로 가기
                  },
                  onFavoriteToggle: () {
                    setState(() {
                      productData.isFavortie = !productData.isFavortie;
                    });
                    print('찜했음? : ${productData.isFavortie}');
                  },
                ),
                // 상품명, 가격, 설명 영역
                ProductInfoSection(productData: productData),
              ],
            ),
          ),
        ],
      ),
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
