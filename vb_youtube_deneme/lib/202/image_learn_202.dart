import 'package:flutter/material.dart';

class ImageLearnMid extends StatefulWidget {
  const ImageLearnMid({super.key});

  @override
  State<ImageLearnMid> createState() => _ImageLearnMidState();
}

class _ImageLearnMidState extends State<ImageLearnMid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        const Text("Image Learn 202"),
        Image.asset(ImagePath.manzara.filePath())
      ]),
    );
  }
}

enum ImagePath {
  manzara,
}

extension ImagePathFind on ImagePath {
  String filePath() {
    switch (this) {
      case ImagePath.manzara:
        return "assets/photos/manzara.jpeg";
    }
  }
}
