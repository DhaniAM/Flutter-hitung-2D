import 'package:flutter/material.dart';
import 'package:hitung_2d/geometry_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1FEAC5),
        title: const Text(
          'Hitung 2D',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const <GeometryTile>[
          GeometryTile(geometryName: 'Persegi'),
          GeometryTile(geometryName: 'Persegi Panjang'),
          GeometryTile(geometryName: 'Segitiga'),
          GeometryTile(geometryName: 'Lingkaran'),
          GeometryTile(geometryName: 'Jajar Genjang'),
          GeometryTile(geometryName: 'Trapesium'),
          GeometryTile(geometryName: 'Belah Ketupat'),
          GeometryTile(geometryName: 'Layang-Layang'),
        ],
      ),
    );
  }
}
