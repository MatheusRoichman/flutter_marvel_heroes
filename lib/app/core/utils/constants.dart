import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

abstract class ThemeColors {
  static const Color primaryRed = Color(0xFFF2264B);
  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryDark = Color(0xFF313140);
  static const Color primaryGrey = Color(0xFFB7B7C8);
  static const Color primarySilver = Color(0xFFF8F8F8);
  static const Color primaryWhite = Color(0xFFFFFFFF);

  static const LinearGradient gradientBlue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF005BEA),
      Color(0xFF00C6FB),
    ],
  );
  static const LinearGradient gradientRed = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFED1D24),
      Color(0xFFED1F69),
    ],
  );
  static const LinearGradient gradientPurple = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFB224EF),
      Color(0xFF7579FF),
    ],
  );
  static const LinearGradient gradientGreen = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0BA360),
      Color(0xFF3CBA92),
    ],
  );
  static const LinearGradient gradientPink = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFF7EB3),
      Color(0xFFFF758C),
    ],
  );
  static const LinearGradient gradientBlack = LinearGradient(
    begin: Alignment(0.0, 0.3),
    end: Alignment(0.0, 0.75),
    colors: [
      Color.fromARGB(0, 0, 0, 0),
      Color(0xFF000000),
    ],
  );
  static const LinearGradient gradientDark = LinearGradient(
    begin: Alignment(0.0, 0.4),
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(0, 0, 0, 0),
      Color(0xFF000000),
    ],
  );
}

abstract class Themes {
  static final mainAppTheme = ThemeData(
    fontFamily: Fonts.graphie,
  );
}

abstract class SystemUICustomOverlayStyle {
  static const light = SystemUiOverlayStyle(
    statusBarColor: ThemeColors.primarySilver,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  static const transparent = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );
}

abstract class EnvVars {
  static const baseURL = String.fromEnvironment('BASE_URL');
}