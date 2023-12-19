
import "package:flutter/material.dart";

class ChatPageOne extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<ChatPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat one"),
      ),
      body: Text("Chat page one"),
    );
  }
}
