import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/extension/mediaquery.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alert Learn")),
      body: Column(children: [
        const Text("Alert"),
        ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Mehmet"),
                    content: Text("içerik" * 20),
                    buttonPadding: PaddingItems.all,
                    titlePadding: PaddingItems.all,
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("İptal")),
                      TextButton(
                          onPressed: () {
                            print("tamam tıklandı");
                            Navigator.pop(context);
                          },
                          child: const Text("Tamam")),
                    ],
                  );
                },
              );
            },
            child: const Text("Alert Dialog")),
        ElevatedButton(
            onPressed: () {
              showAboutDialog(context: context, applicationVersion: "vv");
            },
            child: const Text("show about ")),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Dialog(
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: SizedBox(
                        height: context.height / 6,
                        width: context.width / 2,
                        child: Column(
                          children: [
                            const Text("başlık"),
                            const Text("içerik"),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("İptal")),
                                TextButton(
                                    onPressed: () {
                                      //print("tamam tıklnadı");
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Tamam")),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Text("dialog kulllarak")),
        InteractiveViewer(
          child: Image.network(
            "https://picsum.photos/200/300",
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}
