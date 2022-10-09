import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  final String path;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const ImageAsset({
    Key? key,
    required this.path,
    this.fit,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      height: height,
      width: width,
    );
  }
}