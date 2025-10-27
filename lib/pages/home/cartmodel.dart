import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier{
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItem(String name, int price){
    _cartItems.add({'name': name, 'price': price});
    notifyListeners();
  }

void removeItem(int index){
  _cartItems.removeAt(index);
  notifyListeners();
}
bool get isCartEmpty => _cartItems.isEmpty;
}
final cartModel = Cartmodel();