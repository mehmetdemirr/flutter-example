import 'dart:ffi';

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
  bool progresBarGorunum=false;
  double ilerleme=50.0;
  var sonuc=TextEditingController();
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
            Visibility(
              visible:progresBarGorunum,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.redAccent),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        progresBarGorunum=true;
                      });
                    },
                    child: Text("Aç"),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      progresBarGorunum=false;
                    });
                  },
                  child: Text("Kapat"),
                ),
              ],
            ),
            Slider(
                min: 0.0,
                max: 100.0,
                value:ilerleme,
                onChanged: (veri){
                  setState(() {
                    ilerleme=veri;
                  });
                }
            ),
            Text("İlerleme:$ilerleme"),
          ],
        ),
      ),
    );
  }
}
