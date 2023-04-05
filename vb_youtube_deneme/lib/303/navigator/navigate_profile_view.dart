import 'package:flutter/material.dart';

class NavigateProfile extends StatefulWidget {
  const NavigateProfile({super.key});

  @override
  State<NavigateProfile> createState() => _NavigateProfileState();
}

class _NavigateProfileState extends State<NavigateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profileview")),
      body: Column(children: const [
        Text("Profile view"),
      ]),
    );
  }
}
