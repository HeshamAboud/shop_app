
import "package:flutter/material.dart";

class StatisticPageOne extends StatefulWidget {
  @override
  _StatisticOneState createState() => _StatisticOneState();
}

class _StatisticOneState extends State<StatisticPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up one"),
      ),
      body: Text("Sign up page one"),
    );
  }
}
