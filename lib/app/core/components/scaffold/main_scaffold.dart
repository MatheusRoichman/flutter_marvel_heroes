import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;

  const MainScaffold({super.key, this.appBar, this.body});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }
}
