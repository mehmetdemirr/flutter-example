import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({super.key});

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  var tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Padding(
          padding: PaddingItems.all,
          child: TextField(
            controller: tfController,
            maxLength: 20,
            keyboardType: TextInputType.text,
            autofillHints: [AutofillHints.email],
            inputFormatters: [
              TextInputFormatter.withFunction((oldValue, newValue) {
                return newValue;
              })
            ],
            decoration: InputDecoration(
              hintText: "Parolanızı giriniz",
              labelText: "Parolo",
              prefixIcon: Icon(Icons.lock),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            buildCounter: (context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                    width: 10.0 * (currentLength ?? 0.0),
                    color: Colors.green,
                  ),
                ],
              );
            },
          ),
        ),
        TextField(),
      ]),
    );
  }
}
