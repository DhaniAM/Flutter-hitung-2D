import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class LayangLayangPage extends StatelessWidget {
  final String geometryImgDetail;
  const LayangLayangPage({super.key, required this.geometryImgDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layang-Layang',
          style: TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myLightGreen,
        foregroundColor: myBlack,
      ),
    );
  }
}
