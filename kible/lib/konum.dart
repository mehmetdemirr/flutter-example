import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kible/pusula.dart';

class Konum extends StatefulWidget {
  const Konum({super.key});

  @override
  State<Konum> createState() => _KonumState();
}

class _KonumState extends State<Konum> {
  double enlem = 0.0;
  double boylam = 0.0;
  bool isLoading = false;
  bool isRequiredPermission = false;
  Position? currentLocation;
  double kibleDerecesi = 0.0;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void permissionOK() {
    determinePosition().then((pos) {
      isLoading = true;
      currentLocation = pos;
      if (pos == null) {
        isRequiredPermission = true;
      } else {
        isRequiredPermission = false;
      }
    });
  }

  Future<void> konumBilgisiAl() async {
    var konum = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .catchError((e) {
      print("Eror : ${e.toString()}");
    });
    setState(() {
      enlem = konum.latitude;
      boylam = konum.longitude;
      kibleDerecesi = dereceBul(enlem, boylam);
    });
  }

  @override
  void initState() {
    super.initState();
    if (isRequiredPermission == false) {
      konumBilgisiAl();
      //fazla sürdüğü için hata veriyor burda yazılmasına
      if (enlem != 0 && boylam != 0) {
        print("doğru döndü");
      } else {
        print("dönmedi");
        permissionOK();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kabemi Bul"),
      ),
      body: Column(
        children: [
          Text(
            "Enlem : $enlem",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "Boylam : $boylam",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "Kıble Derecesi : $kibleDerecesi",
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            //android emülatörde 3 sn geç konum alınıyor
            //konumu sayfa açılırken verirsek direkt sayfaya düşer
            onPressed: () async {
              //permissionOK();
              await konumBilgisiAl().then((_) {
                if (enlem != 0 && boylam != 0) {
                  print("doğru döndü");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Pusula(
                              latitude: enlem,
                              longitude: boylam,
                              derece: kibleDerecesi)));
                }
              });
            },
            child: Text("Konum Al"),
          ),
          ElevatedButton(
            onPressed: () {
              permissionOK();
            },
            child: Text("İzin Al"),
          ),
        ],
      ),
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
