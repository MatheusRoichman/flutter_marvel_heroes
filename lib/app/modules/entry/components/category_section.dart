import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_list.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/buttons/primary_button.dart';
import '../../../core/models/category_model.dart';
import '../../../core/stores/characters_store.dart';
import '../../../core/utils/constants.dart';
import 'category_section_header.dart';

class CategorySection extends StatefulWidget {
  final Category category;
  const CategorySection({required this.category, super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final store = Modular.get<CharactersStore>();

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    await store.getCharacters(category: widget.category.name);
  }

  Widget _buildCardList(String category) {
    if (store.charactersStates[category] != CharacterState.done) return const SizedBox();

    return store.characters[category] != null && store.characters[category]!.isNotEmpty
        ? CardList(
            children: store.characters[category]!.map((character) {
            return CardWidget(
              title: character.characterName,
              subtitle: character.realName,
              imageUrl: '${Assets.images}/${character.imageUrl}',
              onTap: () {
                Modular.to.pushNamed('/characters/${character.id}/');
              },
              width: 140,
              height: 230,
            );
          }).toList())
        : const Center(child: Text('Nenhum personagem encontrado'));
  }

  @override
  Widget build(BuildContext context) {
    Category category = widget.category;

    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySectionHeader(category: category),
          const SizedBox(height: 16),
          if (store.charactersStates[category.name] == CharacterState.loading)
            const Center(
                child: Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: CircularProgressIndicator(),
            )),
          if (store.charactersStates[category.name] == CharacterState.error)
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Center(
                child: Column(
                  children: [
                    const Text('Erro ao carregar personagens'),
                    const SizedBox(height: 10),
                    PrimaryButton(text: 'Tentar novamente', onTap: _init),
                  ],
                ),
              ),
            ),
          _buildCardList(category.name),
          const SizedBox(height: 40)
        ],
      );
    });
  }
}
