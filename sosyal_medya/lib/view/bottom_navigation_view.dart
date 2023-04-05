import 'package:flutter/material.dart';
import 'package:sosyal_medya/product/color_items.dart';
import 'package:sosyal_medya/view/add.dart';
import 'package:sosyal_medya/view/profile.dart';
import 'package:sosyal_medya/view/reels.dart';
import 'package:sosyal_medya/view/search.dart';
import 'package:sosyal_medya/view/tab_bar_view.dart';

class BottomNavigationViews extends StatefulWidget {
  const BottomNavigationViews({super.key});

  @override
  State<BottomNavigationViews> createState() => _BottomNavigationViewsState();
}

class _BottomNavigationViewsState extends State<BottomNavigationViews> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  double _bottomBarHeight = 0;
  void _afterLayout(_) {
    setState(() {
      _bottomBarHeight =
          MediaQuery.of(context).padding.bottom + kBottomNavigationBarHeight;
    });
  }

  int secilenIndex = 0;

  @override
  Widget build(BuildContext context) {
    var sayfaListesi = [
      TabBarViews(), //AnaSayfa() ve MesajlasmaSAyfa()
      // AramaSayfa(),
      // EkleSayfa(),
      // ReelsSayfa(bottomHeight: _bottomBarHeight),
      ProfilSayfa(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              secilenIndex = index;
            });
          },
          selectedItemColor: ColorItems.selectedColor,
          unselectedItemColor: ColorItems.unselectedColor,
          currentIndex: secilenIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            // BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            // BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
            // BottomNavigationBarItem(icon: Icon(Icons.image), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
      body: sayfaListesi[secilenIndex],
    );
  }
}
