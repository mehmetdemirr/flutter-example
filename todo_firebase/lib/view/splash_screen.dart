import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_firebase/routes/routes.dart';
import 'package:todo_firebase/utils/constants/duration_items.dart';
import 'package:todo_firebase/utils/constants/lottie_items.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(DurationItems.medium.str()).then(
      (_) {
        Get.offNamed(RoutesClass.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Lottie.asset(LottieItems.splash.str())),
          ],
        ),
      ),
    );
  }
}
