import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, this.child, this.onPressed});

  final Widget? child;
  final bool Function(int number)? onPressed;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color _backgrounColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(_backgrounColor),
      ),
      onPressed: () {
        final sayi = Random().nextInt(10);
        bool response = widget.onPressed?.call(sayi) ?? false;
        setState(() {
          _backgrounColor = response ? Colors.green : Colors.red;
        });
      },
      child: widget.child ?? const Text("merhaba"),
    );
  }
}
