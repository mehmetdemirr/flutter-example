import 'package:flutter/material.dart';

class TextLearnWidget extends StatefulWidget {
  const TextLearnWidget({Key? key}) : super(key: key);

  @override
  State<TextLearnWidget> createState() => _TextLearnWidgetState();
}

class _TextLearnWidgetState extends State<TextLearnWidget> {
  String name="Mehmet";
  String? username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ("Welcome $name"*10),
                 maxLines: 3,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   wordSpacing: 1.5,
                   letterSpacing: 1,
                   decoration: TextDecoration.underline,
                   fontStyle: FontStyle.italic,
                   fontWeight: FontWeight.w500,
                   color: Colors.white,
                   decorationColor: Colors.black,
                   height: 1.5,
                   backgroundColor: Colors.black26,
                 ),
              ),
              Text(username ?? "mehmet"),
            ],
          ),
        ),
      ),
    );
  }
}
