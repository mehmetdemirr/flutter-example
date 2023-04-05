import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:kible/konum.dart';

class Pusula extends StatefulWidget {
  const Pusula(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.derece});

  final double latitude;
  final double longitude;
  final double derece; //kabe derecesi

  @override
  State<Pusula> createState() => _PusulaState();
}

class _PusulaState extends State<Pusula> with TickerProviderStateMixin {
  double? heading = 0; //ekran dercesi
  bool kabeDogruYerde = false;

  void kabeDogruYerdeMi() {
    if (widget.derece - 5 <= heading! && heading! <= widget.derece + 5) {
      setState(() {
        kabeDogruYerde = true;
      });
    } else {
      setState(() {
        kabeDogruYerde = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
        kabeDogruYerdeMi();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text("Kabemi Bul"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${heading!.ceil()}\n${widget.derece}",
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // 5 derece sapma payı var
                    kabeDogruYerde
                        ? SizedBox(
                            height: 150,
                            child: Image.asset("assets/ydeneme.jpeg"))
                        : SizedBox(
                            height: 150,
                            child: Image.asset("assets/kdeneme.jpeg"),
                          ),
                    Transform.rotate(
                      angle: ((heading?.ceil() ?? 0) * (pi / 180) * -1),
                      child: Image.asset("assets/kadran.png"),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
