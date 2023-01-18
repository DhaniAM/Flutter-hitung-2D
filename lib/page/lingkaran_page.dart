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

  void hitung() {
    setState(() {
      /// if r exist, count d, L, K
      /// if d exist, count r, L, K
      /// if L exist, count r, d, K
      /// if K exist, count r, d, L
    });
  }

  void reset() {
    setState(() {
      rController.text = '';
      dController.text = '';
      luasController.text = '';
      kelilingController.text = '';
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
