import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_list.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (store.characterState == CharacterState.done &&
          store.characters[widget.category] != null &&
          store.characters[widget.category]!.isEmpty) {
        return Container();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySectionHeader(title: widget.title, category: widget.category),
          const SizedBox(height: 16),
          if (store.characterState == CharacterState.loading)
            const Center(
                child: Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: CircularProgressIndicator(),
            )),
          if (store.characterState == CharacterState.done)
            CardList(
                children: store.characters[widget.category]!.map((character) {
              return CardWidget(
                title: character.characterName,
                subtitle: character.realName,
                imageUrl: '${Assets.images}/${character.imageUrl}',
                onTap: () {
                  Modular.to.pushNamed('/characters/${character.id}/');
                },
              );
            }).toList()),
          const SizedBox(height: 40)
        ],
      );
    });
  }
}
