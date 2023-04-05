import 'package:drawer_yan_sayfa/sayfalar/sayfa1.dart';
import 'package:drawer_yan_sayfa/sayfalar/sayfa2.dart';
import 'package:drawer_yan_sayfa/sayfalar/sayfa3.dart';
import 'package:flutter/material.dart';

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
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranGenisligi=ekranBilgisi.size.width;
    final double ekranYuksekligi=ekranBilgisi.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: sayfaListe[secilenSayfa],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Başlık Tasarımı",style: TextStyle(color: Colors.white,fontSize: ekranYuksekligi/22),),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              title: Text("Sayfa Bir"),
              onTap: (){
                setState(() {
                  secilenSayfa=0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.account_balance),
                  Padding(
                    padding: EdgeInsets.only(left: ekranGenisligi/50),
                    child: Text("Sayfa İki"),
                  ),
                ],
              ),
              onTap: (){
                setState(() {
                  secilenSayfa=1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Sayfa Üç"),
              onTap: (){
                setState(() {
                  secilenSayfa=2;
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
