import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DenemeTelegram extends StatefulWidget {
  const DenemeTelegram({super.key});

  @override
  State<DenemeTelegram> createState() => _DenemeTelegramState();
}

class _DenemeTelegramState extends State<DenemeTelegram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deneme"),
      ),
      body: Center(
        child: Text("mehmet"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Text("deneme"),
        ),
    );
  }
}
