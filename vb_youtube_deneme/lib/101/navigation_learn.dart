import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vb_youtube_deneme/101/ornek_sayfa.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Learn"),
      ),
      body: Column(children: [
        Text("Navigation learn"),
        ElevatedButton(
          onPressed: () {
            NavigationManager.navigateToWidget(context, OrnekSayfa());
          },
          child: Text("Sayfa geç"),
        ),
      ]),
    );
  }
}

class NavigationManager {
  static void navigateToWidget(
    BuildContext context,
    Widget widget,
  ) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) {
            return widget;
          }),
          fullscreenDialog: true,
          settings: RouteSettings(),
        ));
  }
}
