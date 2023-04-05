import 'package:flutter/material.dart';

class OopLearn extends StatefulWidget {
  const OopLearn({super.key});

  @override
  State<OopLearn> createState() => _OopLearnState();
}

class _OopLearnState extends State<OopLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Başlık"),
      ),
      body: Column(children: const [
        Text("OOP LEARN"),
      ]),
    );
  }
}
