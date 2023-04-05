import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/101/Boyut.dart';

class IconLearn extends StatefulWidget {
  const IconLearn({Key? key}) : super(key: key);

  @override
  State<IconLearn> createState() => _IconLearnState();
}

class _IconLearnState extends State<IconLearn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  String metin="Büşraaaa";
  var girditf=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context).size;
    final double ekranYuksekligi=ekranBilgisi.height;
    final double ekranGenisligi=ekranBilgisi.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:Column(
          children: [
            Text(metin),
            Container(
              height: 100,
              width: 100,
              decoration:const BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(10.0)),
                color: Colors.red
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: ekranGenisligi/60,left: ekranGenisligi/60),
              child: TextField(
                controller: girditf,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: "Girdi giriniz",
                  labelText: "Girdi",
                  suffixIcon: Icon(Icons.account_balance,color: Colors.white,),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 20,left: 10),
                    child: Icon(Icons.add),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}



