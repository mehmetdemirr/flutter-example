import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse/data%20class/Mesajlar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Json Parse'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void mesajParse(){
    String strVeri='{"mesajlar":{"mesaj_kod":1,"mesaj_icerik":"başarılı" } }';
    var jsonVeri=json.decode(strVeri);
    var jsonNesne=jsonVeri["mesajlar"];
    var mesaj=Mesajlar.fromJson(jsonNesne);
    print("${mesaj.mesaj_kod} ${mesaj.mesaj_icerik}");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mesajParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }
}
