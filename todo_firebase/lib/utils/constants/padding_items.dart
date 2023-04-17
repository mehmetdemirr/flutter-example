import 'package:flutter/material.dart';

enum PaddingItems {
  small,
  medium,
  large,
  horizantalSmall,
  horizantalMedium,
  horizantalLarge,
  verticalSmall,
  verticalMedium,
  verticallLarge,
  topSmall,
  topMedium,
  topLarge,
  bottomSmall,
  bottomMedium,
  bottomlLarge,
  leftSmall,
  leftMedium,
  leftLarge,
  rightmSmall,
  rightmMedium,
  rightlLarge,
}

extension PaddingItem on PaddingItems {
  EdgeInsets str() {
    switch (this) {
      case PaddingItems.small:
        return const EdgeInsets.all(10);
      case PaddingItems.medium:
        return const EdgeInsets.all(15);
      case PaddingItems.large:
        return const EdgeInsets.all(25);
      case PaddingItems.horizantalSmall:
        return const EdgeInsets.symmetric(horizontal: 10);
      case PaddingItems.horizantalMedium:
        return const EdgeInsets.symmetric(horizontal: 15);
      case PaddingItems.horizantalLarge:
        return const EdgeInsets.symmetric(horizontal: 25);
      case PaddingItems.verticalSmall:
        return const EdgeInsets.symmetric(vertical: 10);
      case PaddingItems.verticalMedium:
        return const EdgeInsets.symmetric(vertical: 15);
      case PaddingItems.verticallLarge:
        return const EdgeInsets.symmetric(vertical: 25);
      case PaddingItems.topSmall:
        return const EdgeInsets.only(top: 10);
      case PaddingItems.topMedium:
        return const EdgeInsets.only(top: 15);
      case PaddingItems.topLarge:
        return const EdgeInsets.only(top: 25);
      case PaddingItems.bottomSmall:
        return const EdgeInsets.only(bottom: 10);
      case PaddingItems.bottomMedium:
        return const EdgeInsets.only(bottom: 15);
      case PaddingItems.bottomlLarge:
        return const EdgeInsets.only(bottom: 25);
      case PaddingItems.leftSmall:
        return const EdgeInsets.only(left: 10);
      case PaddingItems.leftMedium:
        return const EdgeInsets.only(left: 15);
      case PaddingItems.leftLarge:
        return const EdgeInsets.only(left: 25);
      case PaddingItems.rightmSmall:
        return const EdgeInsets.only(right: 10);
      case PaddingItems.rightmMedium:
        return const EdgeInsets.only(right: 15);
      case PaddingItems.rightlLarge:
        return const EdgeInsets.only(right: 25);
    }
  }
}
