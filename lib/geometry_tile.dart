import 'package:flutter/material.dart';

class GeometryTile extends StatelessWidget {
  final String geometryName;
  final String geometryImg;
  const GeometryTile(
      {Key? key, required this.geometryName, required this.geometryImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(205, 205, 205, 0.5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(geometryImg),
          ),
          const SizedBox(height: 10),
          Text(geometryName),
        ],
      ),
    );
  }
}
