import 'package:flutter/material.dart';

class NoitemcartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('장바구니가 비어있습니다.',
      style: TextStyle(fontSize: 18,
      fontWeight: FontWeight.bold),),
    ));
    
  }

}