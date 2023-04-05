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
  double sliderValue=50.0;
  bool progressBarGorunum=false;
  bool checkBoxKonrol=false;
  int radioButton=0;
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranGenisligi=ekranBilgisi.size.width;
    final double ekranYuksekligi=ekranBilgisi.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible:progressBarGorunum ,
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        progressBarGorunum=true;
                      });
                    },
                    child: Text("AÇ"),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      progressBarGorunum=false;
                    });
                  },
                  child: Text("Kapat"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ekranGenisligi*0.85,
                  child: Slider(
                      min: 0,
                      max: 100,
                      activeColor: Colors.orange,
                      inactiveColor: Colors.yellow,
                      value: sliderValue,
                      onChanged: (veri){
                        setState(() {
                          sliderValue=veri;
                        });
                      }
                  ),
                ),
                Text("%${sliderValue.toInt()}"),
              ],
            ),
            CheckboxListTile(
                title: Text("Onaylıyor Musun?"),
                controlAffinity: ListTileControlAffinity.leading,
                value: checkBoxKonrol,
                checkColor: Colors.white,
                activeColor: Colors.green,
                onChanged: (bool? veri){
                  setState(() {
                    checkBoxKonrol=veri!;
                  });
                },
            ),
            RadioListTile(
                title: Text("Doğukan"),
                value: 1,
                groupValue: radioButton,
                onChanged: (veri){
                  setState(() {
                    radioButton=veri!;
                  });
                }
            ),
            RadioListTile(
                title: Text("Sözdar"),
                value: 2,
                groupValue: radioButton,
                onChanged: (veri){
                  setState(() {
                    radioButton=veri!;
                  });
                }
            ),

          ],
        ),
      ),
    );
  }
}
