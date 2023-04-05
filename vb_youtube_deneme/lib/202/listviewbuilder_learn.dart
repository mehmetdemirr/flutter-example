import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vb_youtube_deneme/101/scaffold_learn.dart';

class ListviewBuilderLearm extends StatefulWidget {
  const ListviewBuilderLearm({super.key});

  @override
  State<ListviewBuilderLearm> createState() => _ListviewBuilderLearmState();
}

class _ListviewBuilderLearmState extends State<ListviewBuilderLearm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int item) {
          return Card(
            child: Column(children: [
              Text("$item mehmet"),
            ]),
          );
        },
      ),
    );
  }
}
