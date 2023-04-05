import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sosyal_medya/product/string_items.dart';

class BildirimSayfasi extends StatefulWidget {
  const BildirimSayfasi({super.key});

  @override
  State<BildirimSayfasi> createState() => _BildirimSayfasiState();
}

class _BildirimSayfasiState extends State<BildirimSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${StringItems.notification_appbar}"),
      ),
    );
  }
}
