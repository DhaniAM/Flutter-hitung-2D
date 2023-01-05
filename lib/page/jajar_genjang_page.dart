import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class JajarGenjangPage extends StatelessWidget {
  const JajarGenjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jajar Genjang',
          style: TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myPurple,
        foregroundColor: myWhite,
      ),
    );
  }
}
