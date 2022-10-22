import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/typography/typography.dart';
import '../../../core/utils/constants.dart';

class CategorySectionHeader extends StatelessWidget {
  final String title;
  final String category;

  const CategorySectionHeader({required this.title, required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                Modular.to.pushNamed('/category/$category/');
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
    );
  }
}
