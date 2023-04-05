import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/OyunEkrani.dart';
import 'package:sayi_tahmin_oyunu/SonucEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayı Tahmin Oyunu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tahmin Oyunu'),
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

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Tahmin Oyunu",style: TextStyle(color:Colors.blue,fontSize:ekranGenisligi/12),),
            SizedBox(
              width: ekranGenisligi/2,
                child: Image.asset("fotograflar/zar.jpeg"),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> OyunEkrani()));
                },
                child: Text("OYUNA BAŞLA"),
            ),
          ],
        ),
      ),
    );
  }
}
