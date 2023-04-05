import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool isLight = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Learn"),
      ),
      body: Column(children: [
        const Text("Lottie"),
        Lottie.network(LottieUrl.matrix.toStr()),
        GestureDetector(
          onTap: () {
            if (isLight == true) {
              _animationController.animateBack(-0.5);
              isLight = !isLight;
            } else {
              _animationController.animateTo(0.5);
              isLight = !isLight;
            }
          },
          child: Lottie.asset(
            LottieUrl.changeTheme.toStr(),
            repeat: false,
            controller: _animationController,
          ),
        ),
      ]),
    );
  }
}

enum LottieUrl { matrix, changeTheme }

extension LottieStr on LottieUrl {
  String toStr() {
    switch (this) {
      case LottieUrl.matrix:
        return "https://assets5.lottiefiles.com/private_files/lf30_pivbp03f.json";
      case LottieUrl.changeTheme:
        return "assets/lottie/lottie_theme_change.json";
    }
  }
}
