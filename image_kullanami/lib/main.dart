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
      home: const MyHomePage(title: 'Fotoğraf Gösterme'),
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
  bool fotografGorunum=false;

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranEkranGenisligi=ekranBilgisi.size.width;
    final double ekranEkranYuksekligi=ekranBilgisi.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Center(
            child: SizedBox(
              height:ekranEkranGenisligi/2,
                child: Visibility(
                  visible: fotografGorunum,
                    child: Image.asset("Fotograflar/resim.jpeg"),
                ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      fotografGorunum=true;
                    });
                  },
                  child: Text("Göster")
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      fotografGorunum=false;
                    });
                  },
                  child: Text("Gizle")
              ),
            ],
          ),
          Switch(
              activeTrackColor: Colors.lightGreen,
              activeColor: Colors.green,
              value:fotografGorunum,
              onChanged: (veri){
                setState(() {
                  fotografGorunum=veri;
                });
              }
          ),
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7Bv5FezKBiVgKps6sg5qG2zvoDbX9Me4DXQ&usqp=CAU")
        ],
      ),
    );
  }
}
