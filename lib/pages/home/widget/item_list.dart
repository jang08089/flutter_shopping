
import 'package:flutter/material.dart';


Widget itemList(String itemName, int price, VoidCallback onDelete) {
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
                Text('$price원',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
            Spacer(),
            Icon(Icons.shopping_cart_checkout),
            SizedBox(width: 15),
            GestureDetector(
              onTap: onDelete,
              child: Icon(Icons.delete,
              ),
            )
          ],
        );
  }