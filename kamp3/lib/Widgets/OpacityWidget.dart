import 'package:flutter/material.dart';
import 'package:kamp3/ImageManager.dart';

import '../enum/DurationEnum.dart';

class ImageOpacity extends StatefulWidget {
  final ImageManager imageManager;
  const ImageOpacity({super.key, required this.imageManager});
  @override
  State<ImageOpacity> createState() => ImageOpacityState();
}

class ImageOpacityState extends State<ImageOpacity> {

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: DurationEnum.COK.time(),
      child: Image.network(widget.imageManager.randomImage),
    );
  }
}
