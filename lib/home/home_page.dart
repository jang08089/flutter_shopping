import 'package:flutter/material.dart';
import 'package:flutter_shopping/core.dart';
import 'package:flutter_shopping/home/widget/item_list.dart';
import 'package:flutter_shopping/home/widget/other_page.dart';


class HomePage extends StatelessWidget{
  const HomePage({super.key});
  final List<Map<String, dynamic>> dummyItems = const [
    {'name': '패딩', 'price': 2000000, 'selected': true},
    {'name': '패딩', 'price': 2000000, 'selected': true},
    {'name': '패딩', 'price': 2000000, 'selected': true},
    {'name': '패딩', 'price': 2000000, 'selected': true},
  
    
  ];
Widget get bodyContent {
  if(dummyItems.isEmpty){
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('상품이 없습니다 \n상품을 등록해 주세요',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
      ),
      ]
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
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => DetailPage(itemName: item['name'] as String)
                ),
              );
            },
            child: itemList(
              item['name'] as String,
              item['price'] as int,
              item['selected'] as bool,
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
        title: Text('상품 목록',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        ),
        actions: [GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage())
            );
          },
          child: Icon(
          Icons.favorite, 
          color: Colors.orange,), // 찜목록 페이지 완성되면 연결
        ),
          SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())
            );
          },
          child: Icon(
          Icons.shopping_cart), // 장바구니 페이지 완성되면 연결
        ),
      
          SizedBox(width: 10),
      ],
      ),
      
      body: bodyContent,
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Icon(Icons.add, color: Colors.white, size: 50,),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      ), // 상품 등록 페이지 완성되면 연결
    );
  }
}