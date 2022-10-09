import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_marvel_heroes/app/modules/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}