import 'package:flutter/material.dart';

import '../../../../core/components/typography/typography.dart';
import '../../../../core/models/ability_model.dart';
import '../../../../core/utils/constants.dart';
import 'abilities_list.dart';

class CharacterAbilitiesSection extends StatelessWidget {
  final List<Ability> abilities;
  final int maxAbilityLevel;

  const CharacterAbilitiesSection({super.key, required this.abilities, required this.maxAbilityLevel});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Em Forest Hills, Queens, Nova York, o estudante de ensino médio, Peter Parker, é um cientista orfão que vive com seu tio Ben e tia May. Ele é mordido por uma aranha radioativa em uma exposição científica e adquire a agilidade e a força proporcional de um aracnídeo. Junto com a super força, Parker ganha a capacidade de andar nas paredes e tetos.\n\nAtravés de sua habilidade nativa para a ciência, ele desenvolve um aparelho que o permitir lançar teias artificiais. Inicialmente buscando capitalizar suas novas habilidades, Parker cria um traje e, como Homem Aranha, torna-se uma estrela de televisão.",
        style: TTypography.description.merge(const TextStyle(color: ThemeColors.primaryWhite)),
      ),
      const SizedBox(height: 32),
      Text(
        "Habilidades",
        style: TTypography.sectionTitle.merge(const TextStyle(color: ThemeColors.primaryWhite)),
      ),
      const SizedBox(height: 24),
      AbilitiesList(abilities: abilities, maxAbilityLevel: maxAbilityLevel)
    ]);
  }
}
