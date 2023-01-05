import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';
import 'package:hitung_2d/widget/geometry_props.dart';
import 'package:hitung_2d/widget/input_field.dart';

class PersegiPage extends StatelessWidget {
  final String geometryImgDetail;
  const PersegiPage({Key? key, required this.geometryImgDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Persegi',
          style: TextStyle(fontSize: 32),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: myRed,
        foregroundColor: myWhite,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(geometryImgDetail),
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
                      GeometryProps(props: 'Sisi (s): '),
                      GeometryProps(props: 'Luas (L): '),
                      GeometryProps(props: 'Keliling (K): '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      InputField(),
                      InputField(),
                      InputField(),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(myWhite),
                      backgroundColor: MaterialStateProperty.all(myCyan),
                    ),
                    onPressed: () {},
                    child: const Text('Hitung'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(myWhite),
                      backgroundColor: MaterialStateProperty.all(myDarkPink),
                    ),
                    onPressed: () {},
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
