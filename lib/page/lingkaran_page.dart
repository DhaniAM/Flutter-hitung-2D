import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/hitung_button.dart';
import 'package:hitung_2d/widget/input_field.dart';
import 'package:hitung_2d/widget/reset_button.dart';

class LingkaranPage extends StatefulWidget {
  final String geometryImgDetail;
  const LingkaranPage({super.key, required this.geometryImgDetail});

  @override
  State<LingkaranPage> createState() => _LingkaranPageState();
}

class _LingkaranPageState extends State<LingkaranPage> {
  final TextEditingController rController = TextEditingController();
  final TextEditingController dController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController kelilingController = TextEditingController();
  bool counted = false;

  void hitung() {
    setState(() {
      String r = rController.text;
      String d = dController.text;
      String l = luasController.text;
      String k = kelilingController.text;

      /// if r exist, count d, L, K
      if (r != '' && d == '' && k == '' && l == '') {
        int jariJari = int.parse(r);
        dController.text = (jariJari * 2).toString();
        luasController.text = (22 * jariJari * jariJari / 7).toString();
        kelilingController.text = (2 * 22 * jariJari / 7).toString();
        counted = true;

        /// if d exist, count r, L, K
      } else if (d != '' && r == '' && l == '' && k == '') {
        int diameter = int.parse(d);
        rController.text = (diameter / 2).toString();
        luasController.text = (1 / 4 * 22 * diameter * diameter / 7).toString();
        kelilingController.text = (22 * diameter / 7).toString();
        counted = true;

        /// if L exist, count r, d, K
      } else if (l != '' && r == '' && d == '' && k == '') {
        int luas = int.parse(l);
        num jariJari = sqrt(luas * 7 / 22);
        rController.text = jariJari.toString();
        dController.text = (jariJari * 2).toString();
        kelilingController.text = (2 * 22 * jariJari / 7).toString();
        counted = true;

        /// if K exist, count r, d, L
      } else if (k != '' && r == '' && d == '' && l == '') {
        int keliling = int.parse(k);
        num jariJari = (keliling / (2 * 22 / 7));
        rController.text = jariJari.toString();
        dController.text = (jariJari * 2).toString();
        luasController.text = (22 * jariJari * jariJari / 7).toString();
        counted = true;
      } else if (counted == false) {
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
      rController.text = '';
      dController.text = '';
      luasController.text = '';
      kelilingController.text = '';
      counted = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    rController.dispose();
    dController.dispose();
    luasController.dispose();
    kelilingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lingkaran',
          style: TextStyle(fontSize: 24),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myDarkBlue,
        foregroundColor: myWhite,
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
                      GeometryProps(props: 'Jari-jari (r): '),
                      GeometryProps(props: 'Diameter (d): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(controller: rController),
                      InputField(controller: dController),
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
