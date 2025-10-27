import 'package:flutter/material.dart';

class Itemcart extends StatelessWidget{
  const Itemcart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("장바구니"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Divider(),
          itembox(),
          Divider(),
          itembox(),
          Divider(),
          itembox()
        ],
      ),
       bottomSheet: SizedBox(
        width: double.infinity,
        height: 100,
         child: ElevatedButton(onPressed: (){},
         style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(0))
         ), child: Text("구매하기")),
       ),
      );
  }
  Widget itembox(){
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 100,
            color: Colors.grey,
          ),
          Column(
            children: [
              Text("상품이름"),
              Spacer(),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 80,
                    height: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                   Container(
                    width: 30,
                    height: 30,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          SizedBox(width: 20),
          Column(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
              Spacer(),
              Text("16000원")
            ],
          )
        ],
      ),
    );
  }
}