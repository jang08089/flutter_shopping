import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:intl/intl.dart';

class Itemcart extends StatefulWidget{
  const Itemcart({super.key});

  @override
  State<Itemcart> createState() => _ItemcartState();
}

class _ItemcartState extends State<Itemcart> {

@override
void initState(){
  super.initState();
  cartModel.addListener(_updateCartList);
}

@override
void dispose(){
  cartModel.removeListener(_updateCartList);
  super.dispose();
}
void _updateCartList(){
  setState(() {
  });
}

  @override
  Widget build(BuildContext context) {
    final cartItem = cartModel.cartItems;
    final formatter = NumberFormat('#,###');

    return Scaffold(
      appBar: AppBar(
        title: Text("장바구니",
        style: TextStyle(fontSize: 22,
        fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: cartItem.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = cartItem[index];
          final formattedPrice = formatter.format(item['price']);
          final itemNumber = item['number'] as int? ?? 1;
        
        return itembox(
          itemName: item['name'] as String,
          formattedPrice: formattedPrice,
          imagePath: item['image']?.toString() ?? "",
          onDelete: (){
            cartModel.removeItem(index);
          },
          number: itemNumber,
          onPlus: () => cartModel.plusNumber(index),
          onCount: () => cartModel.countNumber(index),
        );
  },
      ),
       bottomSheet: Padding(
         padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
         child: SizedBox(
          width: double.infinity,
          height: 50,
           child: ElevatedButton(onPressed: (){
            showCupertinoDialog(context: context, builder: (BuildContext context){
              return CupertinoAlertDialog(title: Text('구매 완료'), content: Text("상품이 구매되었습니다."),
              actions: [CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("확인"),
            )
            ],
           );
            } 
            );
           },
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
           ), child: Text("구매하기",
           style: TextStyle(fontSize: 18,
           ),
           )
           ),
         ),
       ),
      );
  }
  Widget itembox({
    required String itemName, required String formattedPrice, 
    required VoidCallback onDelete, required String imagePath,
    required int number, required VoidCallback onPlus, required VoidCallback onCount}){

    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: 100,
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color: Colors.grey),
                    child: Image.asset(
                      imagePath, 
                      fit: BoxFit.cover),
                  ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(itemName,
                style: TextStyle(
                  fontSize: 20
                ),),
               SizedBox(height: 30),
               Text('$formattedPrice원',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
            Spacer(),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
                SizedBox(height: 20),
                   Row(children: [
                     GestureDetector(
                      onTap: onCount,
                       child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.grey[400],
                        child: Icon(Icons.remove),
                      ),
                     ),
                    SizedBox(width: 5),
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      color: Colors.grey[400],
                      child: Text(number.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: 5),
                     GestureDetector(
                      onTap: onPlus,
                       child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.grey[400],
                        child: Icon(Icons.add),
                                           ),
                     ),
                  ],
            ),
            SizedBox(height: 20),
              ],
            ),
        ]
            ),
      );
}
}