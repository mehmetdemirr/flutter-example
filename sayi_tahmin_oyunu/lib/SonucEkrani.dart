import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  bool sonuc;
  SonucEkrani(this.sonuc,{Key? key}) : super(key: key);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: widget.sonuc ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Tebrikler Kazandınız :)",
              style: TextStyle(fontSize: ekranYuksekligi/30),
            ),
            SizedBox(
              height: ekranYuksekligi/3,
                child: Image.asset("fotograflar/gulme_emoji.jpeg"),
            ),
          ],
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text(
               "Kaybettiniz :(",
               style: TextStyle(fontSize: ekranYuksekligi/30),
             ),
             SizedBox(
               height: ekranYuksekligi/3,
               child: Image.asset("fotograflar/uzgun_emoji.jpeg"),
             ),
        ],
      ),
    ),
    );
  }
}
