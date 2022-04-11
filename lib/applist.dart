import 'package:flutter/material.dart';
import 'package:senior_tech/my-widgets.dart';

class AppList extends StatelessWidget {
  const AppList({Key? key}) : super(key: key);

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
      body: Center(
          child: Column(
        children: [
          const ExpandableContainer(
            title: Text("Título"),
            child: Text("Hijo"),
            backgroundColor: Colors.red,
            collapsedBackgroundColor: Colors.blue,
          ),
          const ExpandableContainer(
            radius: 20,
            gradient: LinearGradient(
              colors: [Colors.green, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            title: Text("Título 2"),
            child: Text("Hijo 2"),
            backgroundColor: Colors.transparent,
            collapsedBackgroundColor: Colors.transparent,
          ),
          ExpandableContainer(
            title: Container(
              child: const Text("Título"),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            child: const Text("Hijo 3"),
            backgroundColor: Colors.blue,
            collapsedBackgroundColor: Colors.green,
          ),
        ],
      )),
    );
  }
}
