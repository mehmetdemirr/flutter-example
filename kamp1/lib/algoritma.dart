import 'package:kamp1/Human.dart';

import 'Insanlar.dart';

void main(){
  List<int> Money=[50,-2,45];
  for(var i in Money){
    print("$i");
  }
  DiziElemanYazdir(Money);
  OncedenDegerliFonks(sayi: 1000000000000000000);
  //Money.sort();
  List<String> list=Money.map((int index){
    return index>5 ? "Beşten Büyük" : "Beşten Küçük";
  }).toList();
  DiziElemanYazdir(list);

  print(tekMiCiftMi(5));

  int? money=null;
  int m2=5;
  if((money ?? 3)>3){
    print("ife girdi");
  }
  else {
    print("ife girmedi");
  }
  if(money!=null){
    if(money>0){
      print("para sıfırdan büyük");
    }
    else{
      print("para sıfırdan küçük");
    }
  }
  else{
    print("para null");
  }
   var insan=NormalHuman(12, "Ali");

  print(insan.name);
  insan.NameDegistir("mehmet");
  print(insan.name);

  insan.money+=23;
  print(insan.money);

  var deger=Character.FAKE;
  switch(deger){
    case Character.FAKE: print("Fake");
    break;
    case Character.UNSAVE: print("unsave");
    break;
    case Character.SAVE: print("save");
    break;
  }

  var kisi=Insanlar("mehmet", "demir", 20, 300);

  kisi.parasiVarMi();

  Insanlar i2=Insanlar.saf();

  i2.bilgiVer();





}

extension Hokkabaz on Insanlar{

  void parasiVarMi(){
    if(this.money>0){
      print("parası var");
    }
    else{
      print("parası yok");
    }
  }

}

void DiziElemanYazdir(List dizi){
  for(int i=0;i<dizi.length;i++){
    print("Dizinin $i. elemanı :${dizi[i]}");
  }
}

void OncedenDegerliFonks({int sayi=10}){
  print("Girdiğiniz Sayı:$sayi");
}

String tekMiCiftMi(int data){
  String sonuc="";
  if(data%2==0){
    sonuc="$data çift sayıdır.";
  }
  else{
    sonuc="$data tek sayıdır.";
  }
  return sonuc;
}

enum Character{
  FAKE,
  UNSAVE,
  SAVE,
}