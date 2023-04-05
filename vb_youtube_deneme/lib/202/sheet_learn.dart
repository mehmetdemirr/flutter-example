import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sheet Learn"),
      ),
      body: Column(children: const [
        Text("Learn"),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.redAccent,
              barrierColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              context: context,
              builder: (context) {
                return Column(
                  children: const [
                    Text("data"),
                    
                  ],
                );
              });
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}
