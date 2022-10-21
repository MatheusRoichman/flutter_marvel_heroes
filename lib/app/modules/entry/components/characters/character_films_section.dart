import 'package:flutter/material.dart';

import '../../../../core/components/card/card_list.dart';
import '../../../../core/components/card/card_widget.dart';
import '../../../../core/components/typography/typography.dart';
import '../../../../core/models/film_model.dart';
import '../../../../core/utils/constants.dart';

class CharacterFilmsSection extends StatelessWidget {
  final List<Film> films;
  const CharacterFilmsSection({super.key, required this.films});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Filmes",
          style: TTypography.sectionTitle.merge(const TextStyle(color: ThemeColors.primaryWhite)),
        ),
        const SizedBox(height: 24),
        CardList(children: films.map((film) => CardWidget(imageUrl: "${Assets.images}/${film.bannerUrl}")).toList()),
      ],
    );
  }
}
