import 'package:flutter/material.dart';

String buildQueryParams(Map<String, dynamic> params) {
  var paramsList = params.entries.map((entry) => "${entry.key}=${entry.value}").toList();

  return paramsList.join("&");
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}