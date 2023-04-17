// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';

class Kisiler {
  late String kisiAd;
  late int kisiYas;

  Kisiler({
    required this.kisiAd,
    required this.kisiYas,
  });

  factory Kisiler.fromJson(Map<dynamic, dynamic> json) {
    return Kisiler(
      kisiYas: json["kisi_yas"] as int,
      kisiAd: json["kisi_ad"] as String,
    );
  }

  static Future<void> kisiEkle(String ad, int yas) async {
    var refNotlar = FirebaseDatabase.instance.ref().child("kisiler_tablo");
    var kisi = HashMap<String, dynamic>();
    kisi["kisi_ad"] = ad;
    kisi["kisi_yas"] = yas;
    refNotlar.push().set(kisi);
  }

  static Future<void> kisiSil(String key) async {
    var refNotlar = FirebaseDatabase.instance.ref().child("kisiler_tablo");
    refNotlar.child(key).remove();
  }

  static Future<void> kisiGuncelle(String ad, int yas, String key) async {
    var refNotlar = FirebaseDatabase.instance.ref().child("kisiler_tablo");
    var kisi = HashMap<String, dynamic>();
    kisi["kisi_ad"] = ad;
    kisi["kisi_yas"] = yas;
    refNotlar.child(key).update(kisi);
  }

  static Future<void> kisileriGeti() async {
    var refNotlar = FirebaseDatabase.instance.ref().child("kisiler_tablo");
    refNotlar.onValue.listen(
      (event) {
        var gelenDegerler = event.snapshot.value as dynamic;
        if (gelenDegerler != null) {
          gelenDegerler.forEach((key, nesne) {
            var kisi = Kisiler.fromJson(nesne);
            print("****$key****");
            print("Nesnead:${kisi.kisiAd}");
            print("Nesneyas:${kisi.kisiYas}");
          });
        }
      },
    );
  }

  static Future<void> kisileriGetirBirKer() async {
    var refNotlar = FirebaseDatabase.instance.ref().child("kisiler_tablo");
    refNotlar.once().then(
      (event) {
        var gelenDegerler = event.snapshot.value as dynamic;
        if (gelenDegerler != null) {
          gelenDegerler.forEach((key, nesne) {
            var kisi = Kisiler.fromJson(nesne);
            print("****$key****");
            print("Nesnead:${kisi.kisiAd}");
            print("Nesneyas:${kisi.kisiYas}");
          });
        }
      },
    );
  }

//eşitlik arama
  static Future<void> kisilerSorgu() async {
    var refNotlar = FirebaseDatabase.instance.ref().child("kisiler_tablo");
    var sorgu = refNotlar.orderByChild("kisi_ad").equalTo("abdüssamed");
    sorgu.onValue.listen(
      (event) {
        var gelenDegerler = event.snapshot.value as dynamic;
        if (gelenDegerler != null) {
          gelenDegerler.forEach((key, nesne) {
            var kisi = Kisiler.fromJson(nesne);
            print("****$key****");
            print("Nesnead:${kisi.kisiAd}");
            print("Nesneyas:${kisi.kisiYas}");
          });
        }
      },
    );
  }
}
