import 'package:flutter/material.dart';

import '../../../core/components/typography/typography.dart';
import '../../../core/utils/constants.dart';

class CharactersSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CharactersSection({required this.title, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TTypography.sectionTitle.merge(const TextStyle(
                  color: ThemeColors.primaryRed,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  'Ver tudo',
                  style: TTypography.description.merge(const TextStyle(
                    color: ThemeColors.primaryGrey,
                  )),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 230,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: children.length,
              itemBuilder: (context, item) => Container(
                    padding: const EdgeInsets.only(right: 16),
                    child: children[item],
                  )),
        ),
        const SizedBox(height: 40)
      ],
    );
  }
}
