import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_list.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/typography/typography.dart';
import '../../../core/utils/constants.dart';

class CategorySection extends StatelessWidget {
  final String category;
  final String title;
  final List<Widget> children;
  const CategorySection({required this.category, required this.title, required this.children, super.key});

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
                child: GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed('/category/$category');
                  },
                  child: Text(
                    'Ver tudo',
                    style: TTypography.description.merge(const TextStyle(
                      color: ThemeColors.primaryGrey,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 230,
          child: CardList(children: children),
        ),
        const SizedBox(height: 40)
      ],
    );
  }
}
