import 'package:flutter/material.dart';
import '/product/language_learn.dart';

class StatetfulLearn extends StatefulWidget {
  const StatetfulLearn({super.key});

  @override
  State<StatetfulLearn> createState() => _StatetfulLearnState();
}

class _StatetfulLearnState extends State<StatetfulLearn> {
  int num = 0;
  void arttir({int artisMiktari = 1}) {
    setState(() {
      num += artisMiktari;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringItem.title,
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Sonuç:$num",
            style: Theme.of(context).textTheme.headline4,
          ),
          Placeholder(
              //child: Image.asset("assets/photos/manzara.jpeg"),
              )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          arttir(artisMiktari: 5);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
