import 'dart:math';

import 'package:flutter/material.dart';
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;
  late Animation<double> animasonDegerleri;

  @override
  void initState() {
    super.initState();
    animasyonKontrol=AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this,);
    animasonDegerleri=Tween(begin:0.0,end:25.0)
        .animate(CurvedAnimation(parent: animasyonKontrol, curve: Curves.easeIn))..addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    animasyonKontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranGenisligi=ekranBilgisi.size.width;
    final double ekranYuksekligi=ekranBilgisi.size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Stack(
          children: [
            /*
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:AssetImage("fotograflar/manzara.jpeg"),
                    fit: BoxFit.cover,
                ),
              ),
            ),
             */
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Icon(Icons.cloud,size:ekranYuksekligi/5,color: Colors.white,),
                  Transform.translate(
                    offset: Offset(0.0,animasonDegerleri.value),
                    child: Text("Hava Durumu",style: TextStyle(
                        fontSize: ekranYuksekligi/25,
                        color: Colors.white,
                    ),),
                  ),
                  SizedBox(
                    width: ekranGenisligi/2,
                    height: ekranYuksekligi/20,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStatePropertyAll<Color>(Colors.green),
                      ),
                      onPressed: (){
                        animasyonKontrol.repeat(reverse: true);
                      },
                      child: Text("BAŞLA",style: TextStyle(fontSize: ekranYuksekligi/30),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
