import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:vb_youtube_deneme/101/stateful_learn.dart';
import 'package:vb_youtube_deneme/product/language_learn.dart';

class ColorsDemo extends StatefulWidget {
  const ColorsDemo({super.key});

  @override
  State<ColorsDemo> createState() => _ColorsDemoState();
}

class _ColorsDemoState extends State<ColorsDemo> {
  Color containerColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    var ekranBilgsi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgsi.size.width;
    final double ekraYuksekligi = ekranBilgsi.size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ekranGenisligi / 2,
              height: ekraYuksekligi / 7,
              color: containerColor,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  containerColor = Colors.blue;
                });
              },
              child: Text(StringItem.buttonYazi1),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
              onPressed: () {
                setState(() {
                  containerColor = Colors.green;
                });
              },
              child: Text(StringItem.buttonYazi2),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
              ),
              onPressed: () {
                setState(() {
                  containerColor = Colors.red;
                });
              },
              child: Text(StringItem.buttonYazi3),
            ),
          ],
        ),
      ),
    );
  }
}
