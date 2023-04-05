import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vb_youtube_deneme/303/answer_button.dart';
import 'package:vb_youtube_deneme/303/loading_button.dart';
import 'package:vb_youtube_deneme/303/theme_notifier.dart';

class AnswerButtonShow extends StatefulWidget {
  const AnswerButtonShow({super.key});

  @override
  State<AnswerButtonShow> createState() => _AnswerButtonShowState();
}

class _AnswerButtonShowState extends State<AnswerButtonShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Center(
            child: AnswerButton(onPressed: (int number) {
              if (number % 3 == 1) {
                return true;
              } else {
                return false;
              }
            }),
          ),
          const Text("mehmet"),
          LoadingButoon(
            title: "mehmet",
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 2));
            },
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ThemeNotifier>().changeTheme();
              },
              child: const Text("Thme değiştir")),
        ]),
      ),
    );
  }
}
