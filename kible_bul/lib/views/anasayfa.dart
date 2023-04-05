import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/instance_manager.dart';
import 'package:kible_bul/controls/geolocater_controller.dart';
import 'package:kible_bul/pruduct/string_items.dart';
import 'package:kible_bul/views/pusula.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

var geolocaterController = Get.put(GeolocaterController());
late FToast fToast;

class _AnaSayfaState extends State<AnaSayfa> {
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              getLocation();
            },
            child: const Text("izin al"),
          ),
          ElevatedButton(
            onPressed: () {
              getLocation();
              double? latitude = geolocaterController.currentLocation?.latitude;
              double? longitude =
                  geolocaterController.currentLocation?.longitude;
              if (latitude != null && longitude != null) {
                print("latitude:$latitude \n longitude:$longitude");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Pusula(latitude: latitude, longitude: longitude)));
              } else {
                print("null döndü");
              }
            },
            child: const Text("Show"),
          ),
          // Text("latitude:$latitude \n longitude:$longitude \n kıble derecesi:$kibleDerecesi"),
        ],
      )),
    );
  }
}

void getLocation() {
  Geolocator.requestPermission().then((request) {
    if (Platform.isIOS) {
      if (request != LocationPermission.whileInUse) {
        return;
      } else {
        geolocaterController.permissionOK();
      }
    } else if (Platform.isAndroid) {
      if (request != LocationPermission.always) {
        return;
      } else {
        geolocaterController.permissionOK();
      }
    }
  });
}
