import 'package:flutter/material.dart';
import 'package:tab_bar/sayfa1.dart';
import 'package:tab_bar/sayfa2.dart';
import 'package:tab_bar/sayfa3.dart';

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
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Anasayfa"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Bir",
              ),
              Tab(
                text: "İki",
              ),
              Tab(
                text: "Üç",
              ),
            ],
          ),
        ),
        body: TabBarView(
           children: [
             Sayfa1(),
             Sayfa2(),
             Sayfa3(),
           ],
    ),
    ),
    );
  }
}

