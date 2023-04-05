import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/product/language_learn.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text(StringItem.name),
        Padding(
          padding: PaddingItems.horizontal,
          child: TextField(
            maxLength: 10,
            maxLines: 2,
            minLines: 1,
            buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return isFocused! ? Text("$currentLength/$maxLength") : Text("");
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: StringItem.mail,
              hintText: StringItem.ornekMail,
              //filled: true,
              //fillColor: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ]),
    );
  }
}
