import 'package:flutter/material.dart';

abstract class Assets {
  static const String images = "lib/assets/images";
  static const String icons = "lib/assets/icons";
}

abstract class Fonts {
  static const String graphie = "Graphie";
}

abstract class FWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}