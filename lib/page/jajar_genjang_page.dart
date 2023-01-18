import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/hitung_button.dart';
import 'package:hitung_2d/widget/input_field.dart';
import 'package:hitung_2d/widget/reset_button.dart';

class JajarGenjangPage extends StatefulWidget {
  final String geometryImgDetail;
  const JajarGenjangPage({super.key, required this.geometryImgDetail});

  @override
  State<JajarGenjangPage> createState() => _JajarGenjangPageState();
}

class _JajarGenjangPageState extends State<JajarGenjangPage> {
  final TextEditingController s1Controller = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController s2Controller = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController kelilingController = TextEditingController();
  bool counted = false;

  void hitung() {
    setState(() {
      String a = s1Controller.text;
      String t = tinggiController.text;
      String s = s2Controller.text;
      String l = luasController.text;
      String k = kelilingController.text;

      /// if Alas & Tinggi known, count Luas
      if (a != '' && t != '' && l == '' && k == '' && s == '') {
        int alas = int.parse(a);
        int tinggi = int.parse(t);
        luasController.text = (alas * tinggi).toString();
        counted = true;

        /// if Alas, Tinggi, Sisi known, count L & K
      } else if (a != '' && t != '' && l == '' && k == '' && s != '') {
        int alas = int.parse(a);
        int tinggi = int.parse(t);
        int sisi = int.parse(s);
        luasController.text = (alas * tinggi).toString();
        kelilingController.text = (2 * (alas + tinggi)).toString();
        counted = true;

        /// if Luas & Alas known, count Tinggi
      } else if (a != '' && t == '' && l != '' && k == '' && s == '') {
        int alas = int.parse(a);
        int luas = int.parse(l);
        tinggiController.text = (luas / alas).toString();
        counted = true;

        /// if Luas, Sisi, Alas known, count Tinggi, keliling
      } else if (a != '' && t == '' && l != '' && k == '' && s != '') {
        int alas = int.parse(a);
        int luas = int.parse(l);
        int sisi = int.parse(s);
        tinggiController.text = (luas / alas).toString();
        kelilingController.text = (2 * (alas + sisi)).toString();
        counted = true;

        /// if Luas & Tinggi known, count Alas
      } else if (a == '' && t != '' && l != '' && k == '' && s == '') {
        s1Controller.text = (int.parse(l) / int.parse(t)).toString();
        counted = true;

        /// if Luas, Sisi, Tinggi known, count Alas, Keliling
      } else if (a == '' && t != '' && l != '' && k == '' && s != '') {
        num alas = (int.parse(l) / int.parse(t));
        s1Controller.text = alas.toString();
        kelilingController.text = (2 * (alas + num.parse(s))).toString();
        counted = true;

        /// if Alas & Sisi known, count K
      } else if (a != '' && t == '' && l == '' && k == '' && s != '') {
        kelilingController.text = (2 * (int.parse(a) + int.parse(s))).toString();
        counted = true;

        /// if Alas, Sisi, Tinggi known, count K, L
      } else if (a != '' && t != '' && l == '' && k == '' && s != '') {
        kelilingController.text = (2 * (int.parse(a) + int.parse(s))).toString();
        luasController.text = (int.parse(a) * int.parse(t)).toString();
        counted = true;

        /// if K & Alas known, count Sisi
      } else if (a != '' && t == '' && l == '' && k != '' && s == '') {
        s2Controller.text = ((int.parse(k) - (2 * int.parse(a))) / 2).toString();
        counted = true;

        /// if K & Sisi known, count Alas
      } else if (a == '' && t == '' && l == '' && k != '' && s != '') {
        s1Controller.text = ((int.parse(k) - (2 * int.parse(s))) / 2).toString();
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
      s1Controller.text = '';
      s2Controller.text = '';
      tinggiController.text = '';
      luasController.text = '';
      kelilingController.text = '';
      counted = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    s1Controller.dispose();
    s2Controller.dispose();
    tinggiController.dispose();
    luasController.dispose();
    kelilingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jajar Genjang',
          style: TextStyle(fontSize: 24),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myPurple,
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
                      GeometryProps(props: 'Alas / Sisi 1 (a, b): '),
                      GeometryProps(props: 'Tinggi (t): '),
                      GeometryProps(props: 'Sisi 2 (c, d): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(controller: s1Controller),
                      InputField(controller: tinggiController),
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
