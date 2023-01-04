import 'package:flutter/material.dart';
import 'package:hitung_2d/common/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(fontSize: 32),
        ),
        centerTitle: true,
        foregroundColor: myWhite,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              FlutterLogo(
                  size: MediaQuery.of(context).size.width - 100,
                  style: FlutterLogoStyle.horizontal),
              const Text(
                'Hitung 2D',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'merupakan aplikasi untuk menghitung \n luas, keliling, dan sisi dari bangun datar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.8),
              ),
              const SizedBox(height: 24),
              const Text(
                'Dibuat dengan menggunakan Flutter \n 2022 \u00a9 Ramadhani Adjar Mustaqim',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
