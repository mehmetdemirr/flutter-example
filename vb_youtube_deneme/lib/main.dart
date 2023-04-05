import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vb_youtube_deneme/303/navigator/unknow_screen.dart';
import 'package:vb_youtube_deneme/navigator_routes/navigator.dart';

void main() {
  runApp(const MyApp());
}

bool mod = false; // false=> aydınlık  true=> karanlık mod oluyor.

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: false,
        ),
        tabBarTheme: const TabBarTheme(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const UnknowScreen());
      },
      routes: RouteNavigator().item,
      //home: const LottieLearn(),
    );
  }
}
