import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: myWhite,
        backgroundColor: myDarkPink,
        minimumSize: const Size(100, 50),
      ),
      onPressed: () {},
      child: const Text(
        'Reset',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
