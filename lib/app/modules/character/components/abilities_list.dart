import 'package:flutter/material.dart';

import '../../../core/components/typography/typography.dart';
import '../../../core/models/ability_model.dart';
import '../../../core/utils/constants.dart';

class AbilitiesList extends StatelessWidget {
  final List<Ability> abilities;
  const AbilitiesList({super.key, required this.abilities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: abilities.asMap().entries.map((entry) {
        int index = entry.key;
        Ability ability = entry.value;

        List<Widget> bars = [];

        for (int barIndex = 1; barIndex <= ability.maxLevel; barIndex++) {
          Color barColor = ThemeColors.primaryWhite;

          if (barIndex > ability.level) {
            barColor = ThemeColors.primaryWhite.withOpacity(0.25);
          }

          bars.add(Container(
            color: barColor,
            width: 1,
            height: barIndex == ability.level ? 12 : 8,
          ));

          if (barIndex != ability.maxLevel) {
            bars.add(const SizedBox(width: 4));
          }
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ability.name,
                  style: TTypography.ability.merge(
                    TextStyle(color: ThemeColors.primaryWhite.withOpacity(0.75)),
                  ),
                ),
                Row(children: bars),
              ],
            ),
            SizedBox(height: index + 1 != abilities.length ? 26 : 32),
          ],
        );
      }).toList(),
    );
  }
}
