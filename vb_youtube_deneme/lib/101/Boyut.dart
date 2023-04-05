import 'package:flutter/material.dart';

class Boyut{
  static MediaQueryData? _mediaQuery;
  static double? ekranGenisligi;
  static double? ekranYuksekligi;
  static Orientation? oryantasyon;

  static void init(BuildContext context){
    _mediaQuery=MediaQuery.of(context);
    ekranYuksekligi=_mediaQuery?.size.height;
    ekranGenisligi=_mediaQuery?.size.width;
    oryantasyon=_mediaQuery?.orientation;
  }

}