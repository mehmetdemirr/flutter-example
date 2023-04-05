import 'package:flutter/material.dart';
import 'package:tab_bar_example/Sayfalar/sayfa1.dart';
import 'package:tab_bar_example/Sayfalar/sayfa2.dart';
import 'package:tab_bar_example/Sayfalar/sayfa3.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var sayfaListe=[Sayfa1(),Sayfa2(),Sayfa3()];
  int secilenSayfa=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Anasayfa"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Bir",),
              Tab(text: "İki",),
              Tab(text: "Üç",),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Sayfa1(),
            Sayfa2(),
            Sayfa3(),
          ],
        )
      ),
    );
  }
}
