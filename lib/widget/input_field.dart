import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20, left: 10),
      child: Expanded(
        child: SizedBox(
          width: 100,
          height: 50,
          child: TextField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical(y: 1),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: myCyan, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: myLightPink, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: '0',
            ),
          ),
        ),
      ),
    );
  }
}
