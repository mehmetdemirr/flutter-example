import 'package:flutter/material.dart';

class ScaffoldLearn extends StatefulWidget {
  const ScaffoldLearn({Key? key}) : super(key: key);

  @override
  State<ScaffoldLearn> createState() => _ScaffoldLearnState();
}

class _ScaffoldLearnState extends State<ScaffoldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Scaffold Learn")
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("mehmet"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
            label: "Ekle"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: "Ekle"
          ),
        ],
      ),
      extendBody: false,
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        tooltip: "ekle",
        onPressed: (){
          print("floating button tıklandı");
          showModalBottomSheet(context: context, builder: (context)=>SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "a"*2000,
                    style: TextStyle(
                      color: Colors.blue,
                    ),),

                ),
              ],
            ),
          ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
