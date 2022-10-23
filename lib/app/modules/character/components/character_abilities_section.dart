import 'package:flutter/material.dart';

import '../../../core/components/typography/typography.dart';
import '../../../core/models/ability_model.dart';
import '../../../core/utils/constants.dart';
import 'abilities_list.dart';

class CharacterAbilitiesSection extends StatelessWidget {
  final List<Ability> abilities;

  const CharacterAbilitiesSection({super.key, required this.abilities});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 32),
      Text(
        "Habilidades",
        style: TTypography.sectionTitle.merge(const TextStyle(color: ThemeColors.primaryWhite)),
      ),
      const SizedBox(height: 24),
      AbilitiesList(abilities: abilities)
    ]);
  }
}
