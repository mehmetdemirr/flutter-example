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
      home: const MyHomePage(title: 'Butonlar'),
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

  var tfController=TextEditingController();
  String alinanVeri="";

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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                maxLength: 5,
                controller: tfController,
                style: TextStyle(
                  color:Colors.red,
                ),
                decoration: const InputDecoration(
                  hintText: "Yazı yazabiirsiniz...",
                  hintStyle: TextStyle(
                    color:Colors.black,
                  ),
                  labelText: "Yazı Giriniz",
                  filled: true,
                  fillColor: Colors.black12,
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(10.0)),
                  ),
                  prefixIcon: Icon(Icons.print),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  print("Elevated button tıklandı");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    side:BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                child: const Text("Elevated Button",style: TextStyle(
                  color: Colors.white,
                ),),
            ),
            TextButton(
                onPressed: (){
                  print("Text button tıklandı");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  shadowColor: Colors.red,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    side: BorderSide(
                      color: Colors.black,
                      width: 4,
                    ),
                  ),
                ),
                child: Text("Text Button",style: TextStyle(
                  color: Colors.green,
                ),),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Merhaba",
                style: TextStyle(
                color: Colors.green,
                fontSize: 40,
                fontStyle: FontStyle.normal,
                backgroundColor: Colors.amber,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
