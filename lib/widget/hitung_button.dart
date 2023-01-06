import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class HitungButton extends StatelessWidget {
  final Function hitung;
  const HitungButton({Key? key, required this.hitung}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: myWhite,
        backgroundColor: myCyan,
        minimumSize: const Size(100, 50),
      ),
      onPressed: () {
        hitung();
      },
      child: const Text(
        'Hitung',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
