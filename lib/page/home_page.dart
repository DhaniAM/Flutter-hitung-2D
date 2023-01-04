import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/page/about_page.dart';
import 'package:hitung_2d/widget/geometry_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myCyan,
        toolbarHeight: 60,
        title: const Text(
          'Hitung 2D',
          style: TextStyle(color: myWhite, fontSize: 36),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const AboutPage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.info_outline,
                size: 36,
                color: myWhite,
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const <GeometryTile>[
          GeometryTile(
            geometryName: 'Persegi',
            geometryImg: 'assets/img/persegi.jpg',
          ),
          GeometryTile(
            geometryName: 'Persegi Panjang',
            geometryImg: 'assets/img/persegi-panjang.jpg',
          ),
          GeometryTile(
            geometryName: 'Segitiga',
            geometryImg: 'assets/img/segitiga.jpg',
          ),
          GeometryTile(
            geometryName: 'Lingkaran',
            geometryImg: 'assets/img/lingkaran.jpg',
          ),
          GeometryTile(
            geometryName: 'Jajar Genjang',
            geometryImg: 'assets/img/jajar-genjang.jpg',
          ),
          GeometryTile(
            geometryName: 'Trapesium',
            geometryImg: 'assets/img/trapesium.jpg',
          ),
          GeometryTile(
            geometryName: 'Belah Ketupat',
            geometryImg: 'assets/img/belah-ketupat.jpg',
          ),
          GeometryTile(
            geometryName: 'Layang-Layang',
            geometryImg: 'assets/img/layang-layang.jpg',
          ),
        ],
      ),
    );
  }
}
