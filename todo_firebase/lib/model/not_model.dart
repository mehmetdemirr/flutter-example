// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';

import 'package:todo_firebase/model/user_model.dart';

class Not {
  late String key;
  late NotModel not;
  Not({
    required this.key,
    required this.not,
  });
}

class NotModel {
  late int notId;
  late String notBaslik;
  late String notIcerik;
  late bool notTamamla;
  late UserModel user;
  NotModel({
    required this.notId,
    required this.notBaslik,
    required this.notIcerik,
    required this.notTamamla,
  });

  factory NotModel.fromJson(Map<dynamic, dynamic> json) {
    return NotModel(
        notId: json['not_id'] as int,
        notBaslik: json['not_baslik'] as String,
        notIcerik: json['not_icerik'] as String,
        notTamamla: (json['not_tamamla'] ?? false) as bool);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['not_id'] = notId;
    data['not_baslik'] = notBaslik;
    data['not_icerik'] = notIcerik;
    data['not_tamamla'] = notTamamla;
    return data;
  }

  static Future<void> notEkle(NotModel not) async {
    var refNotlar = FirebaseDatabase.instance.ref().child("not_tablosu");
    var n = HashMap<String, dynamic>();
    n["not_id"] = not.notId;
    n["not_baslik"] = not.notBaslik;
    n["not_icerik"] = not.notIcerik;
    n["not_tamalama"] = not.notTamamla;
    refNotlar.push().set(n);
  }

  static Future<void> notSil(String key) async {
    var refNotlar = FirebaseDatabase.instance.ref().child("not_tablosu");
    refNotlar.child(key).remove();
  }

  static Future<void> notGuncelle(String key, NotModel not) async {
    var refNotlar = FirebaseDatabase.instance.ref().child("not_tablosu");
    var n = HashMap<String, dynamic>();
    n["not_id"] = not.notId;
    n["not_baslik"] = not.notBaslik;
    n["not_icerik"] = not.notIcerik;
    n["not_tamalama"] = not.notTamamla;
    refNotlar.child(key).update(n);
  }

  //dinleyen yapıda getir
  static Future<List<Not>> tumNotlariGetir() async {
    var refNotlar = FirebaseDatabase.instance.ref().child("not_tablosu");
    List<Not> notListesi = [];
    refNotlar.onValue.listen(
      (event) {
        var gelenDegerler = event.snapshot.value as dynamic;
        if (gelenDegerler != null) {
          gelenDegerler.forEach((key, nesne) {
            print(nesne);
            var not = NotModel.fromJson(nesne);
            notListesi.add(Not(key: key, not: not));
          });
        }
      },
    );
    return notListesi;
  }

  // dinleme yok sadece bir kere getirir
  static Future<List<Not>> tumNotGetirTekSefer() async {
    var refNotlar = FirebaseDatabase.instance.ref().child("not_tablosu");
    List<Not> notListesi = [];
    refNotlar.once().then(
      (event) {
        var gelenDegerler = event.snapshot.value as dynamic;
        if (gelenDegerler != null) {
          gelenDegerler.forEach((key, nesne) {
            var not = NotModel.fromJson(nesne);
            notListesi.add(Not(key: key, not: not));
          });
        }
      },
    );
    return notListesi;
  }

  //eşitlik arama //her zaman dinleme yapısında sorgu
  static Future<List<Not>> notSorgu(
      String alanAdi, String aranacakKelime) async {
    var refNotlar = FirebaseDatabase.instance.ref().child("not_tablosu");
    var sorgu = refNotlar.orderByChild(alanAdi).equalTo(aranacakKelime);
    List<Not> notListesi = [];
    sorgu.onValue.listen(
      (event) {
        var gelenDegerler = event.snapshot.value as dynamic;
        if (gelenDegerler != null) {
          gelenDegerler.forEach((key, nesne) {
            var not = NotModel.fromJson(nesne);
            notListesi.add(Not(key: key, not: not));
          });
        }
      },
    );
    return notListesi;
  }
  //dummy data
  // static UserModel u =
  //     UserModel(userId: 1, userName: "mehmet", password: "mehmet");
  // static List<NotModel> list = [
  //   NotModel(
  //     notId: 1,
  //     notBaslik: "Pazartesi yürüyüşe çıkılacak xxjıahsaushuıhuıhdcısuıh",
  //     notIcerik: "köpeği gezdrimek için sonra markete uğra" * 50,
  //     notTamamla: false,
  //   NotModel(
  //     notId: 1,
  //     notBaslik: "ders çalış",
  //     notIcerik: "vize takvimi açıklandı ders çalış ",
  //     notTamamla: false,
  //   ),
  // ];
}
