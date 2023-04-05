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

  bool kontrol=false;
  var toggleDurumlar=[false,true,false];
  int secilenToggleIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
                value: kontrol,
                activeColor: Colors.green,
                activeTrackColor: Colors.lightGreenAccent,
                /*
                 inactiveThumbColor: Colors.redAccent,
                inactiveTrackColor: Colors.red,
                 */
                onChanged:(veri){
                  setState(() {
                    kontrol=veri;
                  });
                  print("switch:$kontrol");
                }
            ),
            Text("Switch Değer:$kontrol",style: TextStyle(
              color: kontrol ? Colors.green : Colors.red
            ),
            ),
            ToggleButtons(
                isSelected:toggleDurumlar,
                onPressed: (int secilenIndex){
                  secilenToggleIndex=secilenIndex;
                  setState(() {
                    toggleDurumlar[secilenIndex] ?
                    toggleDurumlar[secilenIndex]=false : toggleDurumlar[secilenIndex]=true;
                  });
                  print("${secilenIndex+1}. toggle button seçildi.");
                },
                children:const [
                  Icon(Icons.access_time_filled),
                  Icon(Icons.two_wheeler_outlined),
                  Icon(Icons.access_alarm_outlined),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
