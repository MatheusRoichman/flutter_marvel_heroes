import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final List<Widget> children;
  const CardList({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: double.infinity,
          height: 230,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: children.length,
              itemBuilder: (context, item) => Container(
                    padding: const EdgeInsets.only(right: 16),
                    child: children[item],
                  )),
        );
  }
}
