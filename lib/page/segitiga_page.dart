import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class SegitigaPage extends StatelessWidget {
  const SegitigaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Segitiga',
          style: TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myDarkGreen,
        foregroundColor: myBlack,
      ),
    );
  }
}
