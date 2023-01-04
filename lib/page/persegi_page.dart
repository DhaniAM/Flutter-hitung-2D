import 'package:flutter/material.dart';

class PersegiPage extends StatelessWidget {
  final String title;
  const PersegiPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: const Color(0xFFFF7898),
        foregroundColor: Colors.white,
      ),
    );
  }
}
