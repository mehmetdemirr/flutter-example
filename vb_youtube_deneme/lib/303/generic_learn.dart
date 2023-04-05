import 'package:flutter/material.dart';

class GenericLearn extends StatefulWidget {
  const GenericLearn({super.key});

  @override
  State<GenericLearn> createState() => _GenericLearnState();
}

class _GenericLearnState extends State<GenericLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generic Learn"),
      ),
      body: Column(children: const [
        Text("Generic"),
      ]),
    );
  }
}
