import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAsset extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;

  const SvgAsset({
    Key? key,
    required this.path,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit,
      height: height,
      width: width,
      color: color,
    );
  }
}