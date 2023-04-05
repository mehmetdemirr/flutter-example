import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sosyal_medya/view/login_register_.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({super.key});

  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn> {
  int saniye = 1;
  void timer() {
    final timer = Timer.periodic(Duration(seconds: 2), (t) {
      if (t.tick < 2) {
        // 2 saniye sonra
        setState(() {
          saniye = t.tick;
        });
      } else {
        t.cancel();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Giris()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Splash Screen $saniye"),
        ]),
      ),
    );
  }
}
