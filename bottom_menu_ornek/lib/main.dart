import 'package:bottom_menu_ornek/sayfa1.dart';
import 'package:bottom_menu_ornek/sayfa2.dart';
import 'package:bottom_menu_ornek/sayfa3.dart';
import 'package:flutter/material.dart';

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
  var sayfaListe=[Sayfa1(),Sayfa2(),Sayfa3()];
  int secilenSayfa=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: sayfaListe[secilenSayfa],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Bir",
              icon: Icon(Icons.account_balance_sharp),
          ),
          BottomNavigationBarItem(
            label: "Bir",
            icon: Icon(Icons.account_balance_sharp),
          ),
          BottomNavigationBarItem(
            label: "Bir",
            icon: Icon(Icons.account_balance_sharp),
          ),
        ],
        currentIndex: secilenSayfa,
        onTap: (indeks){
          setState(() {
            secilenSayfa=indeks;
          });
        },
      ),
    );
  }
}
