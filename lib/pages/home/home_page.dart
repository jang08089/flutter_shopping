import 'package:flutter/material.dart';
import 'package:flutter_shopping/core.dart';
import 'package:flutter_shopping/pages/add_product_pages/add_product_page.dart';
import 'package:flutter_shopping/pages/home/widget/item_list.dart';
import 'package:flutter_shopping/pages/home/widget/other_page.dart';
import 'package:flutter_shopping/pages/product_details/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> items = [
    {'name': '패딩', 'price': 2000000, 'selected': true},
    {'name': '패딩', 'price': 2000000, 'selected': true},
    {'name': '패딩', 'price': 2000000, 'selected': true},
    {'name': '패딩', 'price': 2000000, 'selected': true},
  ];

  Widget get bodyContent {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '상품이 없습니다 \n상품을 등록해 주세요',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(itemName: item['name']?.toString() ?? ""),
                ),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProductDetailsPage()),
              // );
            },
            child: itemList(
              item['name']?.toString() ?? "",
              item['price'] ?? 0,
              item['selected'] as bool,
              imagePath: item["image"]?.toString() ?? "",
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '상품 목록',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
            },
            child: Icon(
              Icons.favorite,
              color: Colors.orange,
            ), // 찜목록 페이지 완성되면 연결
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            child: Icon(Icons.shopping_cart), // 장바구니 페이지 완성되면 연결
          ),

          SizedBox(width: 10),
        ],
      ),

      body: bodyContent,

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductPage()),
          );

          if (newItem != null && newItem is Map<String, dynamic>) {
            setState(() {
              items.add(newItem);
            });
          }
        },
        backgroundColor: Colors.lightBlue,
        elevation: 6,
        highlightElevation: 12,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 40),
      ), // 상품 등록 페이지 완성되면 연결
    );
  }
}
