import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kible_bul/pruduct/string_items.dart';

class Pusula extends StatefulWidget {
  const Pusula({super.key, required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
  @override
  State<Pusula> createState() => _PusulaState();
}

late FToast fToast;

class _PusulaState extends State<Pusula> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringItems.anasayfaBaslik),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () {
            fToast.showToast(
              child: Text("latitude:${widget.latitude}\n"
                      "longitude:${widget.longitude}\n" +
                  "kıble derecesi:${dereceBul(widget.latitude, widget.longitude)}"),
              gravity: ToastGravity.BOTTOM,
              toastDuration: Duration(seconds: 2),
            );
          },
          child: const Text("Değerleri Göster"),
        ),
      ]),
    );
  }
}

double dereceBul(double? latitude, double? longitude) {
  if (latitude != null && longitude != null) {
    double phiK = 21.4 * pi / 180.0;
    double lambdaK = 39.8 * pi / 180.0;
    double phi = latitude * pi / 180.0;
    double lambda = longitude * pi / 180.0;
    double psi = 180.0 /
        pi *
        atan2(sin(lambdaK - lambda),
            cos(phi) * tan(phiK) - sin(phi) * cos(lambdaK - lambda));
    double qiblaDirection = psi >= 0 ? psi : 360 + psi;
    return qiblaDirection;
  }
  return 0.0;
}
