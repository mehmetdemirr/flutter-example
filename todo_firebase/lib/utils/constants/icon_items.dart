enum IconItems {
  home,
}

extension IconItem on IconItems {
  String str() {
    switch (this) {
      case IconItems.home:
        return "";
    }
  }
}
