import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/data%20classes/ImageItems.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';

class OrnekSayfa extends StatefulWidget {
  const OrnekSayfa({Key? key}) : super(key: key);

  @override
  State<OrnekSayfa> createState() => _OrnekSayfaState();
}

class _OrnekSayfaState extends State<OrnekSayfa> {
  final textMetin = "Welcome";
  final ortaMetin = "Create Your First Note";
  final altMetin =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard";
  final buttonMetin = "Create A Note";
  final _importsnote = "Imports Note";
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(textMetin),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: ekranGenisligi / 10,
                right: ekranGenisligi / 10,
                top: ekranYuksekligi / 20),
            child: Image.asset(ImageItems.manzara),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ekranGenisligi / 20,
                right: ekranGenisligi / 20,
                top: ekranYuksekligi / 20),
            child: Text(ortaMetin,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ekranGenisligi / 20,
                right: ekranGenisligi / 20,
                top: ekranYuksekligi / 50),
            child: Text(
              altMetin,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: PaddingItems.horizontal,
              child: Text(buttonMetin,
                  style: Theme.of(context).textTheme.headline4?.copyWith()),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
          ),
          Padding(
            padding: PaddingItems.all,
            child: TextButton(
              onPressed: () {},
              child: Text(
                _importsnote,
                style: Theme.of(context).textTheme.headline5?.copyWith(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
