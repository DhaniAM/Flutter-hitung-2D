import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hitung 2D',
      theme: ThemeData(primarySwatch: Colors.cyan, fontFamily: 'Itim'),
      home: const HomePage(),
    );
  }
}
