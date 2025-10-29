import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:flutter_shopping/pages/chat/chat_page.dart';
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

  // 장바구니에 존재하는지 'name'으로 찾기
  @override
  void initState() {
    super.initState();
    final itemName = widget.item['name'];
    alreadyCart = cartModel.cartItems.any((item) => item['name'] == itemName);
  }

  // 장바구니 저장 여부 상태 갱신
  void toggleCart() {
    setState(() {
      alreadyCart = !alreadyCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    //home_page에서 매개변수로 받은 item을 null-safe처리와 동시에 사용하기 쉽게 변수에 저장
    final imagePath = widget.item['image'] ?? 'assets/images/error.jpg';
    final title = widget.item['name'] ?? '상품명 미기재';
    final price = widget.item['price'] ?? 0;
    final contents = widget.item['contents'] ?? '상품설명 없음';

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 130,
            ), // bottomSheet 높이만큼 (없으면 스크롤이 끝까지 안되므로)
            child: Column(
              children: [
                // 상품 사진 위젯
                ProductImageSection(imagePath: imagePath),
                // 상품 정보 위젯
                ProductInfoSection(
                  title: title,
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
              alreadyCart: alreadyCart,
              onBack: () {
                Navigator.pop(context);
              },
              onCartToggle: toggleCart,
              // onCartTap: onCartTap,
            ),
          ),
        ],
      ),

      // bottomSheet 영역
      bottomSheet: ProductBottomSheet(
        onCartToggle: toggleCart,
        name: title,
        imagePath: imagePath,
        price: price,
        contents: contents,
        alreadyCart: alreadyCart,
      ),
    );
  }
}
