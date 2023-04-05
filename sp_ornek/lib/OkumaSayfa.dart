import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OkumaSayfa extends StatefulWidget {
  const OkumaSayfa({Key? key}) : super(key: key);

  @override
  State<OkumaSayfa> createState() => _OkumaSayfaState();
}

class _OkumaSayfaState extends State<OkumaSayfa> {
  Future<void> veriOku() async {
    var sp=await SharedPreferences.getInstance();
    String ad = sp.getString("ad") ?? "ad yok";
    String soyad = sp.getString("soyad") ?? "soyad yok";

    print("ad:$ad");
    print("soyad:$soyad");

  }

  @override
  void initState() {
    super.initState();
    veriOku();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Okuma Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
