import 'package:flutter/material.dart';

class GeometryTile extends StatelessWidget {
  final String geometryName;
  const GeometryTile({Key? key, required this.geometryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(205, 205, 205, 0.5),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          const Text('image'),
          Text(geometryName),
        ],
      ),
    );
  }
}
