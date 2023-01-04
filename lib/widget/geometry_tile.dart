import 'package:flutter/cupertino.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/page/persegi_page.dart';

class GeometryTile extends StatelessWidget {
  final String geometryName;
  final String geometryImg;
  const GeometryTile({Key? key, required this.geometryName, required this.geometryImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => PersegiPage(geometryName),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: myGrey,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(geometryImg),
            ),
            const SizedBox(height: 15),
            Text(
              geometryName,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
