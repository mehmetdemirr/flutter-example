import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/SonucEkrani.dart';

class OyunEkrani extends StatefulWidget {
  const OyunEkrani({Key? key}) : super(key: key);

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  late int rasgeleSayi;
  int hak=5;
  String yardim="";
  bool yardimGorunurluk=false;
  bool sonuc=false;
  TextEditingController sayiTahmin=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rasgeleSayi=Random().nextInt(100)+1;
    print("Tutulan Sayı:$rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Oyun Ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Kalan Hak:$hak",style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: ekranGenisligi/12,
                fontWeight: FontWeight.bold,
            ),
            ),
            Visibility(
              visible:yardimGorunurluk,
                child: Text("Yardım:$yardim",style: TextStyle(color:Colors.black54,fontSize: ekranGenisligi/15),),
            ),
            Padding(
              padding: EdgeInsets.only(right: ekranGenisligi/20,left: ekranGenisligi/20,bottom: ekranGenisligi/10),
              child: TextField(
                controller:sayiTahmin,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  hintText: "Tahmin giriniz...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(ekranGenisligi/40)),
                  ),
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  int alinanSayi=int.parse(sayiTahmin.text.toString());
                  if(rasgeleSayi != alinanSayi){
                    setState(() {
                      hak-=1;
                      yardimGorunurluk=true;
                      if(rasgeleSayi>alinanSayi){
                        yardim="Arttır";
                      }
                      else if(rasgeleSayi<alinanSayi){
                        yardim="Azalt";
                      }

                      });
                  }
                  else{
                    setState(() {
                      yardimGorunurluk=false;
                      sonuc=true;
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc)));
                    });
                  }
                  if(hak==0){
                    sonuc=false;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc)));
                  }
                  setState(() {
                    sayiTahmin.text="";
                  });
                },
                child: Text("TAHMİN ET",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ekranGenisligi/22,
                  ),
                ),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purpleAccent)),
            ),
          ],
        ),
      ),
    );
  }
}
