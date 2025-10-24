import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping/pages/product_details_pages/product_details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.separated(
          itemCount: colors.length,
          separatorBuilder: (_, __) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductDetailsPage()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: colors[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
