import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCollations extends StatefulWidget {
  const MyCollations({super.key});

  @override
  State<MyCollations> createState() => _MyCollationsState();
}

class _MyCollationsState extends State<MyCollations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: Card(
              margin: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
              child: Column(children: [
                Expanded(child: Image.asset("assets/photos/manzara.jpeg")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Abstract Dart"),
                      Text("34 ETH"),
                    ],
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
