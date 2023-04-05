import 'package:flutter/material.dart';

import 'state_manager.dart';

 abstract class SayacViewModel extends State<StateManager>{

  int sayac = 0;

  void sayacArttir() {
    setState(() {
      sayac += 1;
    });
  }
}
