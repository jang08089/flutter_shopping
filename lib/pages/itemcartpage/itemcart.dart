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
        title: Text("장바구니"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: cartItem.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = cartItem[index];
          final formattedPrice = formatter.format(item['price']);
        
        return itembox(
          itemName: item['name'] as String,
          formattedPrice: formattedPrice,
          onDelete: (){
            cartModel.removeItem(index);
          },
        );
  },
      ),
       bottomSheet: Padding(
         padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
         child: SizedBox(
          width: double.infinity,
          height: 50,
           child: ElevatedButton(onPressed: (){},
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

  Widget itembox({required String itemName, required String formattedPrice, required VoidCallback onDelete}){
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
              Text(itemName),
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
              IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
              Spacer(),
              Text(formattedPrice)
            ],
          )
        ],
      ),
    );
  }
}