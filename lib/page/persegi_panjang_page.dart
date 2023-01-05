import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class PersegiPanjangPage extends StatelessWidget {
  final String geometryImgDetail;
  const PersegiPanjangPage({super.key, required this.geometryImgDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Persegi Panjang',
          style: TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myYellow,
        foregroundColor: myBlack,
      ),
    );
  }
}
