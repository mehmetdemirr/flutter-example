import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeriTabaniYardimcisi{
  static const String veriTabaniAdi="rehber.sqlite";

  static Future<Database> veriTabaniErisim() async {
    String veriTabaniYolu = join( await getDatabasesPath(),veriTabaniAdi);

    if(await databaseExists(veriTabaniYolu)){
      print("veri tabanı zaten var . Kopyalamaya gerek yok");
    }
    else{
      ByteData data= await rootBundle.load("database/$veriTabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veriTabaniYolu).writeAsBytes(bytes,flush: true);
      print("veri tabani kopyalandı");
    }
    return openDatabase(veriTabaniYolu);
  }

}