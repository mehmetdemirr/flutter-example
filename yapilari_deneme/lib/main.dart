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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Yapıları Deneme'),
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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Başlık"),
            //Text("Alt başlık"),
          ],
        ),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed:(){
                print("Bilgi basıldı");
              },
              icon:Icon(Icons.info_outline),
          ),
          PopupMenuButton(
            child: Icon(Icons.more_vert_outlined),
              itemBuilder: (context)=>[
                PopupMenuItem(
                  value: 1,
                  child: Text("Sil"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Güncelle"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("Ayarlar"),
                ),
              ],
            onCanceled: (){

            },
            onSelected: (deger){

            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                        duration: Duration(seconds: 5),
                        content: Text(
                            "İnternet bağlantısı yok!",
                          style: TextStyle(color: Colors.black),
                        ),
                      action:SnackBarAction(
                        label: "Tekrar Dene",
                        onPressed: (){
                          print("Tekrar deniyor.");
                          TextButton(
                              onPressed: (){
                                print("Tekrar deneniyor...");
                              },
                              child: Text("Tekrar Dene")
                          );
                        },
                      )
                    ),
                  );
                },
                child: Text("Snack Bar Aç"),
            ),
            ElevatedButton(
                child:Text("Alert Dialog Aç"),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Başlık"),
                          content: Text("içerik"),
                          actions: [
                            TextButton(
                                child: Text("İptal"),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                            ),
                            TextButton(
                              child: Text("Tamam"),
                              onPressed: (){
                                print("Tamam Tıklanıldı");
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      }
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
