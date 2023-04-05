import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sosyal_medya/product/string_items.dart';

class AyarlarSayfa extends StatefulWidget {
  const AyarlarSayfa({super.key});

  @override
  State<AyarlarSayfa> createState() => _AyarlarSayfaState();
}

class _AyarlarSayfaState extends State<AyarlarSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringItems.ayarlar),
      ),
      body: Column(children: [
        Text("Ayarlar 1"),
        Text("Ayarlar 2"),
      ]),
    );
  }
}
