import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/navigator_routes/navigator.dart';

class NavigateHome extends StatefulWidget {
  const NavigateHome({super.key});

  @override
  State<NavigateHome> createState() => _NavigateHomeState();
}

class _NavigateHomeState extends State<NavigateHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home view")),
      body: Column(children: [
        const Text("home view"),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNavigatorEnum.profile.str());
            },
            child: const Text("profil")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context, RouteNavigatorEnum.homeDetails.str(),
                arguments: "mehmet",
                // (Route<dynamic> route) => false,
              );
            },
            child: const Text("home details")),
      ]),
    );
  }
}
