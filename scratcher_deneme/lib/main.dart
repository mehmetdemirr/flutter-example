import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

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

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranGenisligi=ekranBilgisi.size.width;
    final double ekranYuksekligi=ekranBilgisi.size.height;
    GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Çizmeye Başla",style: TextStyle(
                fontStyle: FontStyle.italic,
              fontSize:ekranYuksekligi/30,
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi/30),
              child: Scratcher(
                brushSize:5,
                color: Colors.white,
                  onChange: (value)=>print("Boyanan kısım: %$value"),
                  child: Container(
                    width: ekranGenisligi/1.2,
                    height: ekranYuksekligi/20,
                    color: Colors.black,
                  ),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top:ekranYuksekligi/30),
              child: Text("Şansını Dene",style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize:ekranYuksekligi/30,
              ),),
            ),
            Padding(
              padding:EdgeInsets.only(top: ekranYuksekligi/30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Scratcher(
                    brushSize: 5,
                    color: Colors.black,
                    child: SizedBox(
                      height: ekranYuksekligi/10,
                      width: ekranGenisligi/5,
                      child: Image.asset("assets/photos/manzara.png"),
                    ),
                  ),
                  Scratcher(
                    color:Colors.black,
                    brushSize: 5,
                    child: SizedBox(
                      height: ekranYuksekligi/10,
                      width: ekranGenisligi/5,
                      child: Container(
                        child: Center(child: Text("Tekrar dene")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top:ekranYuksekligi/30),
              child: SizedBox(
                height: ekranYuksekligi/2,
                width: ekranGenisligi/1.5,
                child: SfSignaturePad(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
                child: Text("Save As Image"),
                onPressed: () async {
                  Image image =
                  (await _signaturePadKey.currentState!.toImage()) as Image;
                }
            ),

          ],
        ),
      ),
    );
  }
}
