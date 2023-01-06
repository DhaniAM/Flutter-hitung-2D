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

  void hitung() {
    setState(() {});
  }

  void reset() {
    setState(() {
      s1Controller.text = '';
      s2Controller.text = '';
      tinggiController.text = '';
      luasController.text = '';
      kelilingController.text = '';
    });
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
