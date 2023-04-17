enum LottieItems {
  theme,
  splash,
  success,
  unsuccess,
}

extension LottieItem on LottieItems {
  String str() {
    switch (this) {
      case LottieItems.theme:
        return "assets/lottie/dark_mode.json";
      case LottieItems.splash:
        return "assets/lottie/splash.json";
      case LottieItems.success:
        return "assets/lottie/true.json";
      case LottieItems.unsuccess:
        return "assets/lottie/false.json";
    }
  }
}
