import 'package:flutter/material.dart';

class ListTileLearn extends StatefulWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  @override
  State<ListTileLearn> createState() => _ListTileLearnState();
}

class _ListTileLearnState extends State<ListTileLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(Icons.money),
            selectedColor: Colors.green,
            selected: false,
            title: Container(
              width: MediaQuery.of(context).size.width / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 170, 35, 14),
              ),
              child: Column(
                children: [
                  Text("mehmet"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
