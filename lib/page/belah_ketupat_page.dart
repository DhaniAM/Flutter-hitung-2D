import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class BelahKetupatPage extends StatelessWidget {
  final String geometryImgDetail;
  const BelahKetupatPage({super.key, required this.geometryImgDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belah Ketupat',
          style: TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myLightBlue,
        foregroundColor: myBlack,
      ),
    );
  }
}
