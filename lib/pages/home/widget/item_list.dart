
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

    

Widget itemList(String itemName, int price, VoidCallback onDelete, VoidCallback onCartTap) {
final formatter = NumberFormat('#,###');
final formattedPrice = formatter.format(price);

    return Row(
            children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue
              )
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName,
                style: TextStyle(
                  fontSize: 20),
                  ),
                  SizedBox(height: 10),
                Text('$formattedPrice원',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: onCartTap,
              child: Icon(Icons.shopping_cart)),
            SizedBox(width: 15),
            GestureDetector(
              onTap: onDelete,
              child: Icon(Icons.delete,
              ),
            )
          ],
        );
  }
