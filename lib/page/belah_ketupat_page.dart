import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/hitung_button.dart';
import 'package:hitung_2d/widget/input_field.dart';
import 'package:hitung_2d/widget/reset_button.dart';

class BelahKetupatPage extends StatefulWidget {
  final String geometryImgDetail;
  const BelahKetupatPage({super.key, required this.geometryImgDetail});

  @override
  State<BelahKetupatPage> createState() => _BelahKetupatPageState();
}

class _BelahKetupatPageState extends State<BelahKetupatPage> {
  final TextEditingController d1Controller = TextEditingController();
  final TextEditingController d2Controller = TextEditingController();
  final TextEditingController sisiController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController kelilingController = TextEditingController();
  bool counted = false;

  void hitung() {
    setState(() {
      String d1 = d1Controller.text;
      String d2 = d2Controller.text;
      String s = sisiController.text;
      String l = luasController.text;
      String k = kelilingController.text;

      /// if d1, d2 known, count L
      if (d1 != '' && d2 != '' && l == '') {
        int diag1 = int.parse(d1);
        int diag2 = int.parse(d2);
        luasController.text = (diag1 * diag2 / 2).toString();
        counted = true;
      }

      /// if s known, count K
      if (s != '' && k == '') {
        int sisi = int.parse(s);
        kelilingController.text = (4 * sisi).toString();
        counted = true;
      }

      /// if K known, count s
      if (k != '' && s == '') {
        int keliling = int.parse(k);
        sisiController.text = (keliling / 4).toString();
        counted = true;
      }

      /// if L, d1 known, count d2
      if (l != '' && d1 != '' && d2 == '') {
        int luas = int.parse(l);
        int diag1 = int.parse(d1);
        d2Controller.text = ((luas * 2) / diag1).toString();
        counted = true;
      }

      /// if L, d2 known, count d1
      if (counted == false) {
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
      d1Controller.text = '';
      d2Controller.text = '';
      sisiController.text = '';
      luasController.text = '';
      kelilingController.text = '';
      counted = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    d1Controller.dispose();
    d2Controller.dispose();
    sisiController.dispose();
    luasController.dispose();
    kelilingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belah Ketupat',
          style: TextStyle(fontSize: 24),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myLightBlue,
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
                      GeometryProps(props: 'Diagonal 1 (d1): '),
                      GeometryProps(props: 'Diagonal 2 (d2): '),
                      GeometryProps(props: 'Sisi (s): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(controller: d1Controller),
                      InputField(controller: d2Controller),
                      InputField(controller: sisiController),
                      InputField(controller: luasController),
                      InputField(controller: kelilingController),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HitungButton(hitung: hitung),
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
