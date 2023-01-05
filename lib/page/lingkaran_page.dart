import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class LingkaranPage extends StatelessWidget {
  final String geometryImgDetail;
  const LingkaranPage({super.key, required this.geometryImgDetail});

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
        backgroundColor: myDarkBlue,
        foregroundColor: myWhite,
      ),
    );
  }
}
