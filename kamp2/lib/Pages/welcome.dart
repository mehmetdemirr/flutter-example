import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.favorite),
               onPressed:(){

               },
          ),
        ],
        title:Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.ac_unit_outlined),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      body: Column(
        children: const [

        ],
      ),
    );
  }
}
