import 'package:flutter/material.dart';

part './part.dart';

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({super.key});

  @override
  State<PartOfLearn> createState() => _PartOfLearnState();
}

class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _appbar(),
      body: Column(children: const [Text("Part of")]),
    );
  }
}
