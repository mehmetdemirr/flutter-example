import 'package:flutter/material.dart';

class ButtonLearn extends StatefulWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  State<ButtonLearn> createState() => _ButtonLearnState();
}

class _ButtonLearnState extends State<ButtonLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Learn"),
      ),
      body: Center(
        child: Column(
          children: [
           TextButton(
            onPressed: (){
              print("Text button tıklandı");
            }, child: Text("Text Button ",style: Theme.of(context).textTheme.headline5,),
           ),
            ElevatedButton(
                onPressed: (){
                  print("Elevated Button tıklandı");
                },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states){
                  if(states.contains(MaterialState.pressed)){
                    return Colors.black12;
                  }
                  return Colors.green;
                }),),
              child: Text("Elevated Button"),
              ),
            IconButton(
                onPressed: (){
                  print("Icon Button tıklanadı");
                },
                icon: const Icon(Icons.account_balance_outlined),
            ),
            FloatingActionButton(
                onPressed:(){
                  print("floating action button tıklandı");
                },
              splashColor: Colors.yellow,
              child: Icon(Icons.access_alarm_outlined),
            ),
            OutlinedButton(
                onPressed:(){
                  print("outline button tıklandı");
                },
                child: const Text("aa"),
            ),
            InkWell(
              onTap: (){
                print("Inkwell button tıklandı");
              },
                child: const Text("custom"),
            ),
            SizedBox(height: 100,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                )
              ),
                onPressed: (){

                },
                child: Padding(
                  padding: const EdgeInsets.only(top:10,bottom:10,right: 40,left: 40),
                  child: Text("Place Bid",style:
                  Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white,),),
                ),
            ),
          ],
      ),
      ),
    );
  }
}
