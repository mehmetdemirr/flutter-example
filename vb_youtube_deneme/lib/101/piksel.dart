import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pixels/pixels.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PixelImageController(
    palette: const PixelPalette.rPlace(),
    width: 64,
    height: 64,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PixelEditor(
          controller: _controller,
        ),
      ),
    );
  }
}
