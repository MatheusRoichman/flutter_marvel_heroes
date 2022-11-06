import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double? mainAxisExtent;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const CardGrid(
      {super.key,
      required this.crossAxisCount,
      required this.itemCount,
      required this.itemBuilder,
      required this.crossAxisSpacing,
      required this.mainAxisSpacing,
      required this.mainAxisExtent});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
