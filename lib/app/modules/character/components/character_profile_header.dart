import 'package:flutter/material.dart';

import '../../../core/components/typography/typography.dart';
import '../../../core/utils/constants.dart';

class CharacterProfileHeader extends StatelessWidget {
  final String realName;
  final String characterName;

  const CharacterProfileHeader({super.key, required this.realName, required this.characterName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(realName,
            style: TTypography.profileSubtitle.merge(
              const TextStyle(color: ThemeColors.primaryWhite),
            )),
        const SizedBox(height: 8),
        Text(characterName,
            style: TTypography.profileTitle.merge(
              const TextStyle(color: ThemeColors.primaryWhite),
            )),
      ],
    );
  }
}
