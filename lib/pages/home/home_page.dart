import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/core.dart';
import 'package:flutter_shopping/pages/add_product_pages/add_product_page.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:flutter_shopping/pages/itemcartpage/noitemcart_page.dart';
import 'package:flutter_shopping/pages/home/widget/item_list.dart';
import 'package:flutter_shopping/pages/itemcartpage/itemcart.dart';
import 'package:flutter_shopping/pages/mypage/mypage.dart';
import 'package:flutter_shopping/pages/product_details/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [];
  @override
  void initState(){
    super.initState();
    cartModel.addListener(_updateHomeState);
  }
  @override
  void dispose(){
    cartModel.removeListener(_updateHomeState);
    super.dispose();
  }
  void _updateHomeState(){
    setState(() {
    });
  
  }

void showDelete(BuildContext context, int index){
  showCupertinoDialog(context: context,
   builder: (BuildContext context){
    return CupertinoAlertDialog(
      title: Text('상품을 삭제하시겠습니까?'),
      actions: <Widget>[
        CupertinoDialogAction(child: Text("취소"), 
        onPressed: (){Navigator.of(context).pop();
        },
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: Text("삭제"), 
        onPressed: (){Navigator.of(context).pop();
        deleteItem(index);
        },// 삭제 확인창
        ),
      ],
    );
   }
  );
}
void deleteItem(int index){
  setState(() {
    items.removeAt(index);
  });
}
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
      );// 상품 없는 화면
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final item = items[index];
          final deleteIndex = index;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailsPage()),
              ); // 상세페이지 연결
            },
            child: itemList(
              item['name'] as String,
              item['price'] as int,
              imagePath: item['image']?.toString() ?? "",
              () => showDelete(context, index),
              (){
               cartModel.addItem(item['name'] as String, item['price'] as int);
               ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("장바구니에 추가되었습니다",
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold),),
                backgroundColor: Colors.grey[700],
                duration: Duration(seconds: 1),
                 ), // 장바구니 아이콘 눌렀을 때 나오는 스낵바
               );
              }
            ),
          );
        },
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
final bool currentIsCartEmpty = cartModel.isCartEmpty;
  
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
                MaterialPageRoute(builder: (context) => Mypage()),// 마이페이지 연결 완료
              );
            },
            child: Icon(Icons.person_2), 
          ),
          SizedBox(width: 30),
        ],
      ),

      body: bodyContent,

      bottomNavigationBar: Padding(padding: EdgeInsets.only(right: 15, left: 15, bottom: 30),
      child: GestureDetector(
        onTap: (){
          Widget targetPage = currentIsCartEmpty ? NoitemcartPage() : Itemcart();
          Navigator.push(context,
           MaterialPageRoute(builder: (context) => targetPage)
           );// 상품 추가 안 했을 때는 빈화면
        },
        child: Container(
            alignment: Alignment.center,
            width: double.infinity, height: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
          color: Colors.lightBlue),
          child: Text('장바구니 가기',
          style: TextStyle(fontSize: 16,
          color: Colors.white),
          ), // 장바구니 페이지와 연결 완료
        ),
      ),
        ),
      
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
