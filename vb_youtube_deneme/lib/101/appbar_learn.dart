import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearn extends StatefulWidget {
  const AppBarLearn({Key? key}) : super(key: key);

  @override
  State<AppBarLearn> createState() => _AppBarLearnState();
}

class _AppBarLearnState extends State<AppBarLearn> {

  final String appBarTitle="Welcome APP";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          onPressed: (){
            print("geri tuşu");
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: (){
                print("ekle");
              },
              icon:Icon(Icons.add),
          ),
          IconButton(
              onPressed: (){
                print("daha fazla");
              },
              icon: Icon(Icons.more_vert_outlined)
          ),
          //const CircularProgressIndicator(color: Colors.red,backgroundColor: Colors.white,)
        ],
      ),
      body: Center(
        child:Column(
          children: const[
            Text("Mehmet"),
          ],
        ),
      ),
    );
  }
}
