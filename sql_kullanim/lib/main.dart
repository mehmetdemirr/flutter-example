import 'package:flutter/material.dart';
import 'package:sql_kullanim/Kisiler.dart';
import 'package:sql_kullanim/KisilerDao.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Future<void> kisileriGoster() async {
    var liste=await KisilerDao().tumKisiler();
    for(var i in liste){
      print("id : ${i.kisi_id} - ad : ${i.kisi_ad} - yaş : ${i.kisi_yas}");
    }
  }

  Future<void> kisiEkle(String kisi_ad,int yas) async {
    await KisilerDao().kisiEkle(kisi_ad,yas);
  }
  @override
  void initState() {
    super.initState();
    kisileriGoster();
    kisiEkle("doğukan",2);
    kisiEkle("yunus",56);
    kisiEkle("demir",34);
    kisiEkle("ilkan",23);
    kisileriGoster();
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
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
