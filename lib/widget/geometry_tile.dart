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
                  PersegiPage();
                  break;
                case 'Persegi Panjang':
                  PersegiPanjangPage();
                  break;
                case 'Segitiga':
                  SegitigaPage();
                  break;
                case 'Lingkaran':
                  LingkaranPage();
                  break;
                case 'Jajar Genjang':
                  JajarGenjangPage();
                  break;
                case 'Trapesium':
                  TrapesiumPage();
                  break;
                case 'Belah Ketupat':
                  BelahKetupatPage();
                  break;
                case 'Layang-Layang':
                  LayangLayangPage();
                  break;
                default:
                  break;
              }
              return PersegiPage();
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
