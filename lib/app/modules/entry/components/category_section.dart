import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_list.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/buttons/primary_button.dart';
import '../../../core/utils/constants.dart';
import '../stores/characters_store.dart';
import 'category_section_header.dart';

class CategorySection extends StatefulWidget {
  final String category;
  final String title;
  const CategorySection({required this.category, required this.title, super.key});

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
    await store.getCharacters(category: widget.category);
  }

  Widget _buildCardList(String category) {
    if (store.charactersStates[category] != CharacterState.done) return const SizedBox();

    return store.characters[category] != null && store.characters[category]!.isNotEmpty ? CardList(
                children: store.characters[category]!.map((character) {
              return CardWidget(
                title: character.characterName,
                subtitle: character.realName,
                imageUrl: '${Assets.images}/${character.imageUrl}',
                onTap: () {
                  Modular.to.pushNamed('/character/${character.id}/');
                },
              );
            }).toList()) : const Center(child: Text('Nenhum personagem encontrado'));
  }

  @override
  Widget build(BuildContext context) {
    String category = widget.category;
    String title = widget.title;

    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySectionHeader(title: title, category: category),
          const SizedBox(height: 16),
          if (store.charactersStates[category] == CharacterState.loading)
            const Center(
                child: Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: CircularProgressIndicator(),
            )),
          if (store.charactersStates[category] == CharacterState.error)
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
          _buildCardList(category),
          const SizedBox(height: 40)
        ],
      );
    });
  }
}
