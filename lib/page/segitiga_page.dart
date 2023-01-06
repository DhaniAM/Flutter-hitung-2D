import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/hitung_button.dart';
import 'package:hitung_2d/widget/input_field.dart';
import 'package:hitung_2d/widget/reset_button.dart';

class SegitigaPage extends StatefulWidget {
  final String geometryImgDetail;
  const SegitigaPage({super.key, required this.geometryImgDetail});

  @override
  State<SegitigaPage> createState() => _SegitigaPageState();
}

class _SegitigaPageState extends State<SegitigaPage> {
  final TextEditingController alasController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController sisiController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController kelilingController = TextEditingController();
  bool counted = false;

  void hitung() {
    setState(() {
      // hitung sisi, Luas, keliling if alas & tinggi available
      if (alasController.text != '' &&
          tinggiController.text != '' &&
          sisiController.text == '' &&
          luasController.text == '' &&
          kelilingController.text == '') {
        int alas = int.parse(alasController.text);
        int tinggi = int.parse(tinggiController.text);
        luasController.text = ((alas * tinggi) / 2).toString();
        num sisi = sqrt(pow((alas / 2), 2) + pow(tinggi, 2));
        sisiController.text = sisi.toString();
        kelilingController.text = (alas + sisi + sisi).toString();
        counted = true;

        // hitung tinggi, Keliling, luas if a,b,c available
      } else if (alasController.text != '' &&
          sisiController.text != '' &&
          tinggiController.text == '' &&
          luasController.text == '') {
        int alas = int.parse(alasController.text);
        int sisi = int.parse(sisiController.text);
        num tinggi = sqrt(pow(sisi, 2) - pow((alas / 2), 2));
        tinggiController.text = tinggi.toString();
        kelilingController.text = (alas + sisi + sisi).toString();
        luasController.text = ((alas * tinggi) / 2).toString();
        counted = true;

        // hitung alas, luas, keliling if tinggi & sisi available
      } else if (tinggiController.text != '' &&
          sisiController.text != '' &&
          alasController.text == '' &&
          luasController.text == '' &&
          kelilingController.text == '') {
        int tinggi = int.parse(tinggiController.text);
        int sisi = int.parse(sisiController.text);
        num alas = sqrt(pow(sisi, 2) - pow(tinggi, 2));
        alasController.text = alas.toString();
        luasController.text = ((alas * tinggi) / 2).toString();
        kelilingController.text = (alas + sisi + sisi).toString();
        counted = true;

        // hitung alas, keliling, sisi if luas, tinggi available
      } else if (luasController.text != '' &&
          tinggiController.text != '' &&
          alasController.text == '' &&
          kelilingController.text == '' &&
          sisiController.text == '') {
        int luas = int.parse(luasController.text);
        int tinggi = int.parse(tinggiController.text);
        num alas = ((luas * 2) / tinggi);
        num sisi = sqrt(pow((alas / 2), 2) + pow(tinggi, 2));
        alasController.text = alas.toString();
        sisiController.text = sisi.toString();
        kelilingController.text = (alas + sisi + sisi).toString();
        counted = true;

        // hitung tinggi, keliling, sisi if luas, alas available
      } else if (luasController.text != '' &&
          alasController.text != '' &&
          tinggiController.text == '' &&
          kelilingController.text == '' &&
          sisiController.text == '') {
        int luas = int.parse(luasController.text);
        int alas = int.parse(alasController.text);
        num tinggi = ((luas * 2) / alas);
        num sisi = sqrt(pow((alas / 2), 2) + pow(tinggi, 2));
        tinggiController.text = tinggi.toString();
        sisiController.text = sisi.toString();
        kelilingController.text = (alas + sisi + sisi).toString();
        counted = true;

        // hitung sisi, luas, tinggi if keliling, alas available
      } else if (kelilingController.text != '' &&
          alasController.text != '' &&
          sisiController.text == '' &&
          luasController.text == '' &&
          tinggiController.text == '') {
        int keliling = int.parse(kelilingController.text);
        int alas = int.parse(alasController.text);
        num sisi = (keliling - alas) / 2;
        num tinggi = sqrt(pow(sisi, 2) - pow((alas / 2), 2));
        sisiController.text = sisi.toString();
        tinggiController.text = tinggi.toString();
        luasController.text = ((alas * tinggi) / 2).toString();
        counted = true;

        // hitung alas, luas, tinggi if keliling, sisi available
      } else if (kelilingController.text != '' &&
          sisiController.text != '' &&
          alasController.text == '' &&
          luasController.text == '' &&
          tinggiController.text == '') {
        int keliling = int.parse(kelilingController.text);
        int sisi = int.parse(sisiController.text);
        num alas = keliling - (sisi * 2);
        num tinggi = sqrt(pow(sisi, 2) - pow((alas / 2), 2));
        alasController.text = alas.toString();
        tinggiController.text = tinggi.toString();
        luasController.text = ((alas * tinggi) / 2).toString();
        counted = true;

        // if none of the above
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
      alasController.text = '';
      tinggiController.text = '';
      sisiController.text = '';
      luasController.text = '';
      kelilingController.text = '';
      counted = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    alasController.dispose();
    sisiController.dispose();
    tinggiController.dispose();
    luasController.dispose();
    kelilingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Segitiga',
          style: TextStyle(fontSize: 24),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myDarkGreen,
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
                      GeometryProps(props: 'Alas (a): '),
                      GeometryProps(props: 'Tinggi (t): '),
                      GeometryProps(props: 'Sisi (b, c): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(controller: alasController),
                      InputField(controller: tinggiController),
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
