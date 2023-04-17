import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/routes/routes.dart';
import 'package:todo_firebase/theme/light_theme.dart';

import 'theme/dark_theme.dart';
import 'translations/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translation(),
      locale: const Locale('tr', 'Tr'),
      fallbackLocale: const Locale('tr', 'Tr'),
      title: 'To Do',
      debugShowCheckedModeBanner: false,
      theme: Get.isDarkMode ? darkTheme : lightTheme,
      initialRoute: RoutesClass.splash,
      getPages: RoutesClass.routes,
    );
  }
}
