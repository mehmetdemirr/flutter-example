import 'package:flutter/material.dart';

enum ColorItems {
  white,
  black,
}

extension ColorItem on ColorItems {
  Color str() {
    switch (this) {
      case ColorItems.white:
        return Colors.white;
      case ColorItems.black:
        return Colors.black;
    }
  }
}
