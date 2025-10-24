import 'package:flutter/material.dart';
import 'package:flutter_shopping/core.dart';
import 'package:flutter_shopping/widget/item_list.dart';


class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
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
        actions: [
          Icon(
          Icons.favorite, 
          color: Colors.orange,),
          SizedBox(width: 15),
        Icon(
          Icons.shopping_cart),
          SizedBox(width: 10),
      ]),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //   Text('상품이 없습니다 \n상품을 등록해 주세요',
      // textAlign: TextAlign.center,
      // style: TextStyle(
      //   fontSize: 18,
      //   fontWeight: FontWeight.bold
      // ),),
      // ]
      // ), 
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            itemList('패딩', 2000000, true),
            SizedBox(height: 5),
            itemList('바지', 20000, false),
            SizedBox(height: 5),
            itemList('가디건', 30000, false),
            SizedBox(height: 5),
            itemList('양말', 3000, true),
          ]
            ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.add, color: Colors.white, size: 50,),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      ),
      
      
    );
  }

  
}