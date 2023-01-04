import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class PersegiPage extends StatelessWidget {
  const PersegiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Persegi',
          style: const TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myDarkPink,
        foregroundColor: myWhite,
      ),
    );
  }
}
