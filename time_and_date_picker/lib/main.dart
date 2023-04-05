import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tsaat=TextEditingController();
  TextEditingController ttarih=TextEditingController();
  String sonuc="";
  var ulkelerListe=<String>[];
  String secilenUlke="Türkiye";

  @override
  void initState() {
   ulkelerListe.add("Türkiye");
   ulkelerListe.add("Amerika");
   ulkelerListe.add("Almanya");
   ulkelerListe.add("İngiltere");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranGenisligi=ekranBilgisi.size.width;
    final double ekranYuksekligi=ekranBilgisi.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:EdgeInsets.only(right: ekranGenisligi/25,left: ekranGenisligi/25),
              child: TextField(
                controller: tsaat,
                decoration: InputDecoration(
                  hintText: "Saat giriniz...",
                ),
                onTap:(){
                  showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                  ).then((alinanSaat){
                    tsaat.text="${alinanSaat!.hour}:${alinanSaat!.minute}";
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: ekranGenisligi/25,
                  left: ekranGenisligi/25,top:ekranGenisligi/40,),
              child: TextField(
                controller:ttarih,
                decoration: InputDecoration(
                  hintText: "Tarih giriniz..."
                ),
                onTap: (){
                  showDatePicker(
                      context: context,
                      initialDate:DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2023),
                  ).then((alinanTarih){
                    ttarih.text="${alinanTarih!.day}/${alinanTarih!.month}"
                        "/${alinanTarih!.year}";
                  });
                },
              ),
            ),
            DropdownButton<String>(
                value: secilenUlke,
                items: ulkelerListe.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text("Ülke:$value",style: TextStyle(
                      color: Colors.green,
                      fontSize: ekranGenisligi/23,
                    ),
                    ),
                  );
                }).toList(),
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String? veri){
                  setState(() {
                    secilenUlke=veri!;
                  });
                },
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    sonuc="Saat:${tsaat.text.toString()}\nTarih:${ttarih.text.toString()}\n"
                        "Seçilen Ülke:$secilenUlke";
                  });
                },
                child: Text("Gönder"),
            ),
            Text(sonuc),
          ],
        ),
      ),

    );
  }
}
