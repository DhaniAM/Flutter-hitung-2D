import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class SegitigaPage extends StatelessWidget {
  final String geometryImgDetail;
  const SegitigaPage({super.key, required this.geometryImgDetail});

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
