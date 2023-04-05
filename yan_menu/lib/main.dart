import 'package:flutter/material.dart';
import 'package:yan_menu/sayfa1.dart';
import 'package:yan_menu/sayfa2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  var sayfaListesi=[Sayfa1(),Sayfa2()];
  int secilenSayfa=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: sayfaListesi[secilenSayfa],
      drawer:Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Başlık"),
            ),
            ListTile(
              title:Text("Sayfa1"),
              onTap: (){
                setState(() {
                  secilenSayfa=0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:Text("Sayfa2"),
              onTap: (){
                setState(() {
                  secilenSayfa=1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
