import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitung_2d/common/constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  const InputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 0),
      child: SizedBox(
        width: 100,
        height: 55,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          textAlignVertical: const TextAlignVertical(y: 1),
          decoration: const InputDecoration(
            hintText: '0',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: myCyan, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: myLightPink, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
