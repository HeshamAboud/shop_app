
import "package:flutter/material.dart";

class WalkThPageOne extends StatefulWidget {
  @override
  _WalkThState createState() => _WalkThState();
}

class _WalkThState extends State<WalkThPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Walk through one"),
      ),
      body: Text("Walk through page one"),
    );
  }
}
