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

  void hitung() {
    setState(() {});
  }

  void reset() {
    setState(() {
      d1Controller.text = '';
      d2Controller.text = '';
      s1Controller.text = '';
      s2Controller.text = '';
      luasController.text = '';
      kelilingController.text = '';
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
