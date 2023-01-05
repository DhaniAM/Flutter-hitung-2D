import 'package:flutter/material.dart';

class GeometryProps extends StatelessWidget {
  final String props;
  const GeometryProps({super.key, required this.props});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 50,
        child: Text(
          props,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
