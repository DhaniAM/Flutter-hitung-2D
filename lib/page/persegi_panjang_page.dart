import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/hitung_button.dart';
import 'package:hitung_2d/widget/input_field.dart';
import 'package:hitung_2d/widget/reset_button.dart';

class PersegiPanjangPage extends StatefulWidget {
  final String geometryImgDetail;
  const PersegiPanjangPage({super.key, required this.geometryImgDetail});

  @override
  State<PersegiPanjangPage> createState() => _PersegiPanjangPageState();
}

class _PersegiPanjangPageState extends State<PersegiPanjangPage> {
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController kelilingController = TextEditingController();
  bool counted = false;

  void hitung() {
    setState(() {
      // hitung luas & keliling if P * l available
      if (panjangController.text != '' &&
          lebarController.text != '' &&
          luasController.text == '' &&
          kelilingController.text == '') {
        int panjang = int.parse(panjangController.text);
        int lebar = int.parse(lebarController.text);
        luasController.text = (panjang * lebar).toString();
        kelilingController.text = (2 * (panjang + lebar)).toString();
        counted = true;

        // hitung P & keliling if luas & l available
      } else if (luasController.text != '' &&
          lebarController.text != '' &&
          panjangController.text == '' &&
          kelilingController.text == '') {
        int luas = int.parse(luasController.text);
        int lebar = int.parse(lebarController.text);
        num panjang = luas / lebar;
        panjangController.text = panjang.toString();
        kelilingController.text = (2 * (panjang + lebar)).toString();
        counted = true;

        // hitung l & keliling if luas & P available
      } else if (luasController.text != '' &&
          panjangController.text != '' &&
          lebarController.text == '' &&
          kelilingController.text == '') {
        int luas = int.parse(luasController.text);
        int panjang = int.parse(panjangController.text);
        num lebar = luas / panjang;
        lebarController.text = lebar.toString();
        kelilingController.text = (2 * (lebar + panjang)).toString();
        counted = true;

        // hitung P & luas if keliling & l available
      } else if (kelilingController.text != '' &&
          lebarController.text != '' &&
          panjangController.text == '' &&
          luasController.text == '') {
        int keliling = int.parse(kelilingController.text);
        int lebar = int.parse(lebarController.text);
        num panjang = (keliling - (2 * lebar)) / 2;
        panjangController.text = panjang.toString();
        luasController.text = (panjang * lebar).toString();
        counted = true;

        // hitung l if keliling & P available
      } else if (kelilingController.text != '' &&
          panjangController.text != '' &&
          lebarController.text == '' &&
          luasController.text == '') {
        int keliling = int.parse(kelilingController.text);
        int panjang = int.parse(panjangController.text);
        num lebar = (keliling - (2 * panjang)) / 2;
        lebarController.text = lebar.toString();
        luasController.text = (lebar * panjang).toString();
        counted = true;
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Salah input'),
              content: const Text('Tidak bisa menghitung :('),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          },
        );
      }
    });
  }

  void reset() {
    setState(() {
      panjangController.text = '';
      lebarController.text = '';
      luasController.text = '';
      kelilingController.text = '';
      counted = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    panjangController.dispose();
    lebarController.dispose();
    luasController.dispose();
    kelilingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Persegi Panjang',
          style: TextStyle(fontSize: 24),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myYellow,
        foregroundColor: myBlack,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Image(
                image: AssetImage(widget.geometryImgDetail),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      SizedBox(height: 20),
                      GeometryProps(props: 'Panjang (p): '),
                      GeometryProps(props: 'Lebar (l): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(controller: panjangController),
                      InputField(controller: lebarController),
                      InputField(controller: luasController),
                      InputField(controller: kelilingController),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HitungButton(
                    hitung: hitung,
                  ),
                  const SizedBox(width: 30),
                  ResetButton(reset: reset),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
