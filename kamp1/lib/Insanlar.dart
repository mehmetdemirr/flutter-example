import 'package:kamp1/algoritma.dart';

class Insanlar{
  late String ad;
  late String soyad;
  late int yas;
  late int money;

  Insanlar(this.ad, this.soyad, this.yas, this.money);

  factory Insanlar.saf(){
    Insanlar insan=Insanlar("ad", "soyad",0,0);
    return insan;
  }

  void bilgiVer(){
    print("Ad:$ad");
    print("Soyad:$soyad");
    print("Yaş:$yas");
    print("Para:$money");
  }

}