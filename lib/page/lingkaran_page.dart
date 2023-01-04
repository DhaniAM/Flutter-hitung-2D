import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class LingkaranPage extends StatelessWidget {
  const LingkaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lingkaran',
          style: TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myDarkPink,
        foregroundColor: myWhite,
      ),
    );
  }
}
