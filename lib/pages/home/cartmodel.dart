import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier{
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItem(String name, int price, {String imagePath = ""}){
    _cartItems.add({'name': name, 'price': price, 'image': imagePath, 'number': 1});
    notifyListeners();
  }

void removeItem(int index){
  _cartItems.removeAt(index);
  notifyListeners();
} // 상품목록 삭제

void removeItemCart(String itemName){
  _cartItems.removeWhere((item) => item['name'] == itemName);
  notifyListeners();
} // 장바구니 삭제

void plusNumber(int index){
  if(index >= 0 && index < _cartItems.length){
    _cartItems[index]['number'] += 1;
    notifyListeners();
  }
} // 상품 수량 증가

void countNumber(int index){
  if(index >= 0 && index < _cartItems.length){
    if(_cartItems[index]['number'] > 1){
      int currentNumber = _cartItems[index]['number'] as int? ?? 1;
    if(currentNumber > 1){
      _cartItems[index]['number'] = currentNumber - 1;
      notifyListeners();
    }
      _cartItems[index]['nember'] -= 1;
      notifyListeners();
    } // 상품 수량 감소
  }
}
bool get isCartEmpty => _cartItems.isEmpty;
}
final cartModel = Cartmodel();