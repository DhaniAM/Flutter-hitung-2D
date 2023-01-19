import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/hitung_button.dart';
import 'package:hitung_2d/widget/input_field.dart';
import 'package:hitung_2d/widget/reset_button.dart';

class LayangLayangPage extends StatefulWidget {
  final String geometryImgDetail;
  const LayangLayangPage({super.key, required this.geometryImgDetail});

  @override
  State<LayangLayangPage> createState() => _LayangLayangPageState();
}

class _LayangLayangPageState extends State<LayangLayangPage> {
  final TextEditingController d1Controller = TextEditingController();
  final TextEditingController d2Controller = TextEditingController();
  final TextEditingController s1Controller = TextEditingController();
  final TextEditingController s2Controller = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController kelilingController = TextEditingController();
  bool counted = false;

  void hitung() {
    setState(() {
      String d1 = d1Controller.text;
      String d2 = d2Controller.text;
      String s1 = s1Controller.text;
      String s2 = s2Controller.text;
      String l = luasController.text;
      String k = kelilingController.text;

      /// if d1, d2 known, count L
      if (d1 != '' && d2 != '' && l == '') {
        int diag1 = int.parse(d1);
        int diag2 = int.parse(d2);
        luasController.text = (diag1 * diag2 / 2).toString();
        counted = true;
      }

      /// if s1, s2 known, count K
      if (s1 != '' && s2 != '' && k == '') {
        int sisi1 = int.parse(s1);
        int sisi2 = int.parse(s2);
        kelilingController.text = ((2 * sisi1) + (2 * sisi2)).toString();
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
      if (l != '' && d2 != '' && d1 == '') {
        int luas = int.parse(l);
        int diag2 = int.parse(d2);
        d1Controller.text = ((luas * 2) / diag2).toString();
        counted = true;
      }

      /// if K, s1 known, count s2
      if (k != '' && s1 != '' && s2 == '') {
        int keliling = int.parse(k);
        int sisi1 = int.parse(s1);
        s2Controller.text = ((keliling - (2 * sisi1)) / 2).toString();
        counted = true;
      }

      /// if K, s2 known, count s1
      if (k != '' && s2 != '' && s1 == '') {
        int keliling = int.parse(k);
        int sisi2 = int.parse(s2);
        s1Controller.text = ((keliling - (2 * sisi2)) / 2).toString();
        counted = true;
      }

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
      s1Controller.text = '';
      s2Controller.text = '';
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
    s1Controller.dispose();
    s2Controller.dispose();
    luasController.dispose();
    kelilingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layang-Layang',
          style: TextStyle(fontSize: 24),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myLightGreen,
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
                      GeometryProps(props: 'Sisi 1 (a, b): '),
                      GeometryProps(props: 'Sisi 2 (c, d): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(controller: d1Controller),
                      InputField(controller: d2Controller),
                      InputField(controller: s1Controller),
                      InputField(controller: s2Controller),
                      InputField(controller: luasController),
                      InputField(
                        controller: kelilingController,
                      ),
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
