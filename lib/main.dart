import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/svg_asset.dart';

import 'app/core/components/app_bar/home_app_bar.dart';
import 'app/core/utils/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Marvel Heroes',
      theme: ThemeData(
        fontFamily: Fonts.graphie,
      ),
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ThemeColors.primarySilver,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(),
        backgroundColor: ThemeColors.primaryWhite,
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
