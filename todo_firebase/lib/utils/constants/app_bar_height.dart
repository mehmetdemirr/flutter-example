enum AppBarHeight {
  low,
  medium,
  large,
}

extension AppBarHeightt on AppBarHeight {
  double str() {
    switch (this) {
      case AppBarHeight.low:
        return 50;
      case AppBarHeight.medium:
        return 56;
      case AppBarHeight.large:
        return 70;
    }
  }
}
