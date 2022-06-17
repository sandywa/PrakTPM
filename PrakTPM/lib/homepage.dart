import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Profile.dart';
import 'TPM.dart';

class HomePage extends StatefulWidget {


  HomePage({Key? key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String _namaLengkap = "";
  String _email = "";
  String _nomorHandphone = "";
  String _alamatRumah = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
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
              Text("Lengkapi Biodata"),
              _buildButtonProfile(),
              _buildButtonTPM()
            ],
          ),
        ),
      ),
    );
  }

  Widget _formInput({required String hint,
    required String label,
    required Function(String value) setStateInput,
    int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Nama Lengkap",
          label: "Nama *",
          setStateInput: (value) {
            setState(() {
              _namaLengkap = value;
            });
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Alamat Email",
          label: "Email *",
          setStateInput: (value) {
            setState(() {
              _email = value;
            });
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Nomor HP Aktif",
          label: "Nomor HP *",
          setStateInput: (value) {
            setState(() {
              _nomorHandphone = value;
            });
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Alamat Rumah",
          label: "Alamat",
          setStateInput: (value) {
            setState(() {
              _alamatRumah = value;
            });
          },
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildButtonProfile() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return MyProfile();
          }));
        },
        child: Text("Profile"),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: TextStyle(fontSize: 16)
        ),
      ),
    );

  }

  Widget _buildButtonTPM() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return TPM();
          }));
        },
        child: Text("TPM"),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: TextStyle(fontSize: 16)
        ),
      ),
    );

  }

  }
