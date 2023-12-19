import 'package:flutter/material.dart';

import '../../../../const/color_const.dart';

class HomePage extends StatelessWidget {
  HomePage(this.onMenuPressed, {super.key});
  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [YELLOW, GREEN, BLUE],
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2.0, 1.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: onMenuPressed,
          child: const Text("Open Menu"),
        ),
      ),
    );
  }
}
