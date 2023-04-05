import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sosyal_medya/view/bottom_navigation_view.dart';
import 'package:sosyal_medya/view/splash_screen.dart';

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
          appBarTheme: const AppBarTheme(
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
            backgroundColor: Color.fromARGB(255, 195, 184, 184),
            centerTitle: false,
            actionsIconTheme: IconThemeData(color: Colors.black),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: const SplashScrenn(),
    );
  }
}
