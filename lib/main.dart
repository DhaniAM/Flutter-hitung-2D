import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() {
  runApp(const Hitung2d());
}

class Hitung2d extends StatelessWidget {
  const Hitung2d({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hitung 2D',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Itim',
      ),
      home: const HomePage(),
    );
  }
}
