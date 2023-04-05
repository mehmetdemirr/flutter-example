import 'package:sosyal_medya/model/post.dart';

import 'adres.dart';
import 'iletisim.dart';

class User {
  late int kisiId;
  late String kullaniciAd;
  late String sifre;
  late String ad;
  late String soyad;
  late String fotograf;
  late int bekarMi; // 1 => Bekar  0 => Evli
  late int cinsiyet; // 1 => Erkek  0 => Kadın
  late bool premimum; // true=> premimum  false => normal
  late DateTime dogumTarih;
  late Adres adres;
  late Iletisim iletisim;
  late List<Post> kaydediledilenPostList;

  User({
    required this.kisiId,
    required this.kullaniciAd,
    required this.sifre,
    required this.ad,
    required this.soyad,
    required this.fotograf,
    required this.bekarMi,
    required this.cinsiyet,
    required this.premimum,
    required this.dogumTarih,
    required this.adres,
    required this.iletisim,
    required this.kaydediledilenPostList,
  });
}
