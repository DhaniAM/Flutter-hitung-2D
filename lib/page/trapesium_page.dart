import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class TrapesiumPage extends StatelessWidget {
  const TrapesiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trapesium',
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
