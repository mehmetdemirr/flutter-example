import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kamp3/Cards/UserCard.dart';
import 'package:kamp3/DataClass/Users.dart';
import 'package:kamp3/ImageManager.dart';
import 'package:kamp3/enum/DurationEnum.dart';

import '../Widgets/OpacityWidget.dart';

class Sayfa1 extends StatefulWidget {
  const Sayfa1({Key? key}) : super(key: key);

  @override
  State<Sayfa1> createState() => _Sayfa1State();
}

class _Sayfa1State extends State<Sayfa1> {

  bool _isLoading=true;
  late final ImageManager randomImage;
  @override
  void initState() {
    super.initState();
    waitForLoading();
    randomImage=ImageManager();
  }

  Future<void> waitForLoading() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _isLoading=false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: _isLoading ? Center(child: CircularProgressIndicator()) :
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Merhaba"),
                ],
              ),
              ImageOpacity(imageManager: randomImage),
              UserCard(user: Users.fake()),
            SizedBox(
              height: 1000,
              child: ListView.builder(
               itemCount: 100,
               itemBuilder: (BuildContext context, int i) =>
                SizedBox(
                  height: 100,
                    child: UserCard(user: Users.fake())),
        ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

