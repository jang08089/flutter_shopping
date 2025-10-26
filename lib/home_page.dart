import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("임시 홈페이지")),
      body: Center(child: Text("Test")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add-product");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
