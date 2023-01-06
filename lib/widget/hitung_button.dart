import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class HitungButton extends StatelessWidget {
  const HitungButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: myWhite,
        backgroundColor: myCyan,
        minimumSize: const Size(100, 50),
      ),
      onPressed: () {},
      child: const Text(
        'Hitung',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
