import 'package:flutter/material.dart';
import 'package:flutter_shopping/itemcartpage/itemcart.dart';
import 'package:flutter_shopping/mypage/mypage.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Mypage()
    );
  }
}

