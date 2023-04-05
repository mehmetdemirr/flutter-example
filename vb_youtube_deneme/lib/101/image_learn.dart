import 'package:flutter/material.dart';

class ImageLearn extends StatefulWidget {
  const ImageLearn({Key? key}) : super(key: key);

  @override
  State<ImageLearn> createState() => _ImageLearnState();
}

class _ImageLearnState extends State<ImageLearn> {
  String metin="mehmet";
  @override 
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
      body:SizedBox(
        width: ekranGenisligi,
        height: ekranYuksekligi,
        child: Image.asset(
          "assets/photos/manzara.jpeg",
          fit:BoxFit.cover,
        ),
      ),
    );
  }
}
