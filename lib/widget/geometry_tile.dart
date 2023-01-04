import 'package:flutter/cupertino.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/page/belah_ketupat_page.dart';
import 'package:hitung_2d/page/jajar_genjang_page.dart';
import 'package:hitung_2d/page/layang_layang_page.dart';
import 'package:hitung_2d/page/lingkaran_page.dart';
import 'package:hitung_2d/page/persegi_page.dart';
import 'package:hitung_2d/page/persegi_panjang_page.dart';
import 'package:hitung_2d/page/segitiga_page.dart';
import 'package:hitung_2d/page/trapesium_page.dart';

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
            builder: (context) {
              switch (geometryName) {
                case 'Persegi':
                  return const PersegiPage();
                case 'Persegi Panjang':
                  return const PersegiPanjangPage();
                case 'Segitiga':
                  return const SegitigaPage();
                case 'Lingkaran':
                  return const LingkaranPage();
                case 'Jajar Genjang':
                  return const JajarGenjangPage();
                case 'Trapesium':
                  return const TrapesiumPage();
                case 'Belah Ketupat':
                  return const BelahKetupatPage();
                case 'Layang-Layang':
                  return const LayangLayangPage();
              }
              return const Center(
                child: Text('Error'),
              );
            },
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
