import 'package:flutter/material.dart';

class TPM extends StatelessWidget {
  const TPM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Profile'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(
                "Hai Selamat Datang TPM",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 24,),
              Text("Beberapa waktu lalu, alat komunikasi handphone hanya dimiliki oleh kalangan tertentu saja yang mampu membelinya, dikarenakan harganya yang cukup mahal.                 Seiring dengan berjalannya waktu, Anda dengan mudah menemukan orang-orang yang memiliki handphone. Karena sekarang ini handphone sudah dilengkapi berbagai fasilitas selain untuk bertukar pesan, seperti internet, kamera digital, pemutar musik dan fasilitas canggih lainnya. Handphone bukan hanya sekedar alat komunikasi, melainkan menjadi gaya hidup yang dapat mendukung penampilan.                Dalam artikel kali ini kami akan membahas lebih detail mengenai definisi atau pengertian handphone itu sendiri, bagaimana sejarah perkembangannya serta apa sebenarnya fungsi dari handphone. Berikut penjelasan lebih dalam mengenai handphone."),
            ],
          ),
        ),
      ),
    );
  }
}
