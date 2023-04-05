import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vb_youtube_deneme/demos/demo1/sayfa1.dart';
import 'package:vb_youtube_deneme/demos/demo1/sayfa2.dart';
import 'package:vb_youtube_deneme/demos/demo1/sayfa3.dart';

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({super.key});

  @override
  State<BottomNavigationDemo> createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int secilenIndeks = 0;
  var sayfaListesi = [
    Sayfa1(),
    Sayfa2(),
    Sayfa3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_alarm), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_task), label: ""),
        ],
        currentIndex: secilenIndeks,
        onTap: (int index) {
          setState(() {
            secilenIndeks = index;
          });
        },
      ),
    );
  }
}
