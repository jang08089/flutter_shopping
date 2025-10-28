import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:flutter_shopping/pages/product_details/chat_page.dart';
import 'package:flutter_shopping/pages/product_details/widgets/image_top_icons.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_bottom_sheet.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_image_section.dart';
import 'package:flutter_shopping/pages/product_details/widgets/product_info_section.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> item;

  ProductDetailsPage({required this.item});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late bool alreadyCart;

  @override
  void initState() {
    super.initState();
    final itemName = widget.item['name'];
    alreadyCart = cartModel.cartItems.any((item) => item['name'] == itemName);
  }

  @override
  Widget build(BuildContext context) {
    final String imagePath = widget.item['image'];
    final String name = widget.item['name'];
    final int price = widget.item['price'];
    final String contents = widget.item['contents'];

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
                  // item 이미지 사용 이미 상품 등록 단계에서 데이터가 없으면 등록이 불가능하게 했지만 외부에서 혹시 잘못된 데이터가 들어올 가능성을 위해 null-safe 처리함
                  imagePath: imagePath ?? 'assets/images/error.jpg',
                ),
                ProductInfoSection(
                  name: name,
                  price: price,
                  contents: contents,
                ),
              ],
            ),
          ),
          // 이미지 위 아이콘 올리기
          Positioned(
            top: 60,
            left: 5,
            right: 5,
            child: ImageTopIcons(
              imagePath: imagePath,
              name: name,
              price: price,
              alreadyCart: alreadyCart,
              onBack: () {
                Navigator.pop(context);
              },
              onCartToggle: () {
                setState(() {
                  alreadyCart = !alreadyCart;
                });
              },
              // onCartTap: onCartTap,
            ),
          ),
        ],
      ),

      // bottomSheet 영역
      bottomSheet: ProductBottomSheet(
        onCartToggle: () {
          setState(() {
            alreadyCart = !alreadyCart;
          });
        },
        name: name,
        imagePath: imagePath,
        price: price,
        contents: contents,
        alreadyCart: alreadyCart,
      ),
    );
  }
}
