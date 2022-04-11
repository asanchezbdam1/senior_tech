import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF5555),
                  Color(0xFFF39239),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
        ),
        title: const Text("Cómo usar el móvil"),
      ),
      backgroundColor: const Color(0xFF9A2828),
    );
  }
}
