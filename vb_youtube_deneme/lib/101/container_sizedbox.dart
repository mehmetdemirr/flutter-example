import 'package:flutter/material.dart';

class ContainerLearn extends StatefulWidget {
  const ContainerLearn({Key? key}) : super(key: key);

  @override
  State<ContainerLearn> createState() => _ContainerLearnState();
}

class _ContainerLearnState extends State<ContainerLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Text("a"*5000),
            ),
            SizedBox.square(
              dimension: 50,
              child: Text("b"*50),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 100,minWidth: 50,maxHeight: 100,minHeight: 50),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                //shape: BoxShape.circle,
                //border: Border.all(
                  //                   width: 2,
                  //                   color: Colors.black,
                  //                 ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple,
                    offset: Offset(0.1,1.0),
                    blurRadius: 10,
                  ),
                ],
                gradient: LinearGradient(colors: [Colors.red,Colors.black38]),
              ),
              child: Text("abc"*10),
            ),
          ],
        ),
      ),
    );
  }
}
