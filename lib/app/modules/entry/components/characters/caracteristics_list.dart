import 'package:flutter/material.dart';

class CaracteristicsList extends StatelessWidget {
  final List<Widget> children;
  const CaracteristicsList({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}