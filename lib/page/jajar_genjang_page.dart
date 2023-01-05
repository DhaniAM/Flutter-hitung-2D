import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class JajarGenjangPage extends StatelessWidget {
  final String geometryImgDetail;
  const JajarGenjangPage({super.key, required this.geometryImgDetail});

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
