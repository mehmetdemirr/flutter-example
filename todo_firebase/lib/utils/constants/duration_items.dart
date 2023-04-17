enum DurationItems {
  theme,
  low,
  medium,
  large,
}

extension DurationItem on DurationItems {
  Duration str() {
    switch (this) {
      case DurationItems.low:
        return const Duration(seconds: 1);
      case DurationItems.medium:
        return const Duration(seconds: 2);
      case DurationItems.large:
        return const Duration(seconds: 3);
      case DurationItems.theme:
        return const Duration(milliseconds: 250);
    }
  }
}
