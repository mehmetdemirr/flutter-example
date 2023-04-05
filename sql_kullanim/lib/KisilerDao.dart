import 'package:sql_kullanim/Kisiler.dart';
import 'package:sql_kullanim/VeriTabaniYardimcisi.dart';

class KisilerDao{
  Future<List<Kisiler>> tumKisiler() async {
    var db= await VeriTabaniYardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from Kisiler");
    return List.generate(maps.length, (index){
      var satir=maps[index];
      return Kisiler(satir["kisi_id"],satir["kisi_ad"],satir["kisi_yas"]);
    });
 }

  Future<void> kisiEkle(String kisi_ad,int kisi_yas) async {
    var db= await VeriTabaniYardimcisi.veriTabaniErisim();

    var bilgiler=Map<String,dynamic>();
    bilgiler["kisi_ad"]=kisi_ad;
    bilgiler["kisi_yas"]=kisi_yas;
    await db.insert("kisiler",bilgiler);
  }
}