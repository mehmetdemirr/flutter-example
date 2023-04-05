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
      home: const MyHomePage(title: 'APP'),
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
  var ulkeler=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ulkeler.add("Türkiye");
    ulkeler.add("İtalya");
    ulkeler.add("Hollanda");
    ulkeler.add("Almanya");
    ulkeler.add("İngiltere");
    ulkeler.add("Amerika");
    ulkeler.add("Türkiye");
    ulkeler.add("İtalya");
    ulkeler.add("Hollanda");
    ulkeler.add("Almanya");
    ulkeler.add("İngiltere");
    ulkeler.add("Amerika");
    ulkeler.add("Türkiye");
    ulkeler.add("İtalya");
    ulkeler.add("Hollanda");
    ulkeler.add("Almanya");
    ulkeler.add("İngiltere");
    ulkeler.add("Amerika");
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
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ulkeler.length,
        itemBuilder: (context,indeks){
          return GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("${ulkeler[indeks]} tıklandı"),
                ),
              );
            },
            child: Card(
              child: SizedBox(
                height:ekranYuksekligi/50,
                child: Row(
                  children: [
                    Icon(Icons.person),
                    Text("${ulkeler[indeks]}"),
                    //Spacer(),
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert_outlined),
                        itemBuilder: (context)=>[
                          PopupMenuItem(
                            value: 1,
                              child: Text("Güncelle"),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text("Sil"),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Text("Ayarlar"),
                          ),
                        ],
                      onSelected: (secilen){
                          if(secilen==1){
                            print("${ulkeler[indeks]} satırının güncelle secildi");
                          }
                          else if(secilen==2){
                            print("${ulkeler[indeks]} satırının sil secildi");
                          }
                          else if(secilen==3){
                            print("${ulkeler[indeks]} satırının ayarlar secildi");
                          }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
