import 'package:flutter/material.dart';

class IndicatorLearn extends StatefulWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  State<IndicatorLearn> createState() => _IndicatorLearnState();
}

class _IndicatorLearnState extends State<IndicatorLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
