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
      debugShowCheckedModeBanner: false,
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
  var toggleListe=[true,true];
  int secilenIndex=0;
  bool switchKontrol=false;
  bool kitapCheckBox=false;
  bool kalemCheckBox=false;
  int radioDeger=0;
  bool progressBarGorunum=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Visibility(
              visible: progressBarGorunum,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.yellow),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        progressBarGorunum=true;
                      });
                    },
                    child: Text("progress aç")
                ),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        progressBarGorunum=false;
                      });
                    },
                    child: Text("progress kapat")
                ),
              ],
            ),
            ToggleButtons(
                color: Colors.green,
                selectedColor: Colors.red,
                fillColor: Colors.yellow,
                //selectedBorderColor: Colors.black, //seçilmiş icona border rengi veriyor
                isSelected: toggleListe,
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.access_alarm_outlined),
                ],
              onPressed: (int secilenId){
                  setState(() {
                    toggleListe[secilenId]=!toggleListe[secilenId];
                    print("Seçilen icon:${secilenId+1}");
                    secilenIndex=secilenId;
                  });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: ElevatedButton(
                  onPressed: (){
                    print("En son seçilen index:$secilenIndex");
                  },
                  child:Text("GÖSTER"),
              ),
            ),
            Switch(
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
                value: switchKontrol,
                onChanged:(bool veri){
                  setState(() {
                    switchKontrol=veri;
                  });
                }
            ),
            CheckboxListTile(
                title: Text("Kitap"),
                //checkColor: Colors.green,

                value: kitapCheckBox,
                onChanged:(bool? kontrol){
                  setState(() {
                    kitapCheckBox=kontrol!;
                  });
                },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text("Kalem"),
              activeColor: Colors.green,
              checkColor: Colors.lightGreenAccent,
              value: kalemCheckBox,
              onChanged:(bool? kontrol){
                setState(() {
                  kalemCheckBox=kontrol!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {

                  });
                },
                child: Text("Göster"),
            ),
            Text("Kalem:$kalemCheckBox\nKitap:$kitapCheckBox"),
            RadioListTile(
                title: Text("Galatasaray"),
                value: 1,
                groupValue: radioDeger,
                activeColor: Colors.lightGreen,
                onChanged:(int? veri){
                  setState(() {
                    radioDeger=veri!;
                    print("radioDeger:$radioDeger");
                  });
                },
            ),
            RadioListTile(
              title: Text("Fenerbahçe"),
              value: 2,
              activeColor: Colors.lightGreen,
              groupValue: radioDeger,
              onChanged:(int? veri){
                setState(() {
                  radioDeger=veri!;
                  print("radioDeger:$radioDeger");
                });
              },
            ),
          ],
        ),
      ),

    );
  }
}
