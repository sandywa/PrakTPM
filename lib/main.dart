import 'package:flutter/material.dart';
import 'package:tugas_flutterlayout/login_statefull.dart';

import 'login_stateless.dart';

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
      title: 'Tugas 2 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: loginStful(),
    );
  }
}
