import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/screens/applist.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30,
      decoration: TextDecoration.none,
    );
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF273243),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Senior Tech',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 30),
            GradButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppList(),
                    ));
              },
              child: const Text(
                'Cómo usar el móvil',
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              gradient: const LinearGradient(
                colors: [Color(0xFFF84545), Color(0xFFAF8312)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              height: 200,
              width: 250,
            ),
            const SizedBox(height: 30),
            GradButton(
              onPressed: () {},
              child: const Text(
                'Navegación segura',
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              gradient: const LinearGradient(
                colors: [Color(0xFF1628CF), Color(0xFF2896E5)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(30),
              height: 200,
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}