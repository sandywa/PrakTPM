import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

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
                "Hai Selamat Datang",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 24,),
              Text("Sandy Wahyu Agusta"),
              Text("NIM 123190145"),
              Text("TPM IF-E"),
              Text("Bugangan Utara Wonosobo"),
              Text("Hobi Berolahraga"),

            ],
          ),
        ),
      ),

    );
  }
}
