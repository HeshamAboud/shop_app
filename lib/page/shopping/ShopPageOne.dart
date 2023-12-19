
import "package:flutter/material.dart";

class ShopPageOne extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<ShopPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping one"),
      ),
      body: Text("Shopping page one"),
    );
  }
}
