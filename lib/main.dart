import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Login Screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 200),
                child: Image.network(
                  "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png",
                  width: 200,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
                
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    hintText: "Masukan Username",
                    icon: Icon(Icons.person),
                    labelText: "Username",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    hintText: "Masukan Kata Sandi",
                    icon: Icon(Icons.vpn_key),
                    labelText: "Kata Sandi",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 300,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text("Masuk"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () {}, child: Text("Belum punya akun? Daftar Disini")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
