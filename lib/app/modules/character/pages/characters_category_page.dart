import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/scaffold/main_scaffold.dart';
import 'package:flutter_marvel_heroes/app/core/models/category_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/app_bar/main_app_bar.dart';
import '../../../core/components/buttons/primary_button.dart';
import '../../../core/components/card/card_widget.dart';
import '../../../core/components/typography/typography.dart';
import '../../../core/models/character_model.dart';
import '../../../core/stores/characters_store.dart';
import '../../../core/utils/constants.dart';

class CharactersCategoryPage extends StatefulWidget {
  final Category category;
  const CharactersCategoryPage({super.key, required this.category});

  @override
  State<CharactersCategoryPage> createState() => _CharactersCategoryPageState();
}

class _CharactersCategoryPageState extends State<CharactersCategoryPage> {
  final store = Modular.get<CharactersStore>();

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    await store.getCharacters(category: widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: MainAppBar(),
      body: ListView(
        children: [
          Observer(
            builder: (_) {
              if (store.charactersStates[widget.category.name] == CharacterState.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (store.charactersStates[widget.category.name] == CharacterState.error) {
                return Center(
                  child: Column(
                    children: [
                      const Text('Erro ao carregar personagens'),
                      const SizedBox(height: 10),
                      PrimaryButton(text: 'Tentar novamente', onTap: _init),
                    ],
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.category.displayName,
                      style: TTypography.homeTitle,
                    ),
                    const SizedBox(height: 20),
                    if (store.characters[widget.category.name]!.isEmpty)
                      Center(
                        child: Column(
                          children: [
                            const Text('Nenhum personagem encontrado'),
                            const SizedBox(height: 10),
                            PrimaryButton(text: 'Tentar novamente', onTap: _init),
                          ],
                        ),
                      )
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 230,
                        ),
                        itemCount: store.characters[widget.category.name]?.length,
                        itemBuilder: (_, index) {
                          Character character = store.characters[widget.category.name]![index];

                          return CardWidget(
                            title: character.characterName,
                            subtitle: character.realName,
                            imageUrl: '${Assets.images}/${character.imageUrl}',
                            onTap: () {
                              Modular.to.pushNamed('/characters/${character.id}/');
                            },
                            width: 170,
                            height: 230,
                          );
                        },
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    store.reset();
    super.dispose();
  }
}
