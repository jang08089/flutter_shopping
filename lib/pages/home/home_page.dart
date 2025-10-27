import 'package:flutter/material.dart';
import 'package:flutter_shopping/core.dart';
import 'package:flutter_shopping/pages/add_product_pages/add_product_page.dart';
import 'package:flutter_shopping/pages/home/widget/item_list.dart';
import 'package:flutter_shopping/pages/home/widget/other_page.dart';
import 'package:flutter_shopping/pages/mypage/mypage.dart';
import 'package:flutter_shopping/pages/product_details/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> dummyItems = [
    {'name': '패딩', 'price': 2000000},
    {'name': '가디건', 'price': 200000},
    {'name': '양말', 'price': 2000},
    {'name': '바지', 'price': 30000},
  ];

  void deleteItem(int index) {
    setState(() {
      dummyItems.removeAt(index);
    });
  }

  Widget get bodyContent {
    if (dummyItems.isEmpty) {
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
        itemCount: dummyItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final item = dummyItems[index];
          final deleteIndex = index;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailsPage()),
              );
            },
            child: itemList(
              item['name'] as String,
              item['price'] as int,
              () => deleteItem(deleteIndex),
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
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mypage(),
                ), // 마이페이지 연결 완료
              );
            },
            child: Icon(Icons.person_2),
          ),
          SizedBox(width: 30),
        ],
      ),

      body: bodyContent,

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(right: 15, left: 15, bottom: 30),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue,
          ),
          child: Text(
            '장바구니 가기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductPage()),
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 50),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ), // 연결 완료
    );
  }
}
