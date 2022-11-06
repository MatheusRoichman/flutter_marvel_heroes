import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/buttons/primary_button.dart';
import '../../../core/components/typography/typography.dart';
import '../../../core/stores/characters_store.dart';
import '../../../core/utils/constants.dart';
import '../components/category_section.dart';

class CharactersHomeTab extends StatefulWidget {
  const CharactersHomeTab({super.key});

  @override
  State<CharactersHomeTab> createState() => _CharactersHomeTabState();
}

class _CharactersHomeTabState extends State<CharactersHomeTab> {
  final store = Modular.get<CharactersStore>();

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    await store.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Escolha o seu personagem',
            style: TTypography.homeTitle.merge(
              const TextStyle(color: ThemeColors.primaryDark),
            )),
        const SizedBox(height: 30),
        Observer(builder: (_) {
          if (store.categoryState == CategoryState.loading) {
            return const Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (store.categoryState == CategoryState.error) {
            return Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Center(
                  child: Column(
                children: [
                  const Text('Erro ao carregar categorias'),
                  const SizedBox(height: 10),
                  PrimaryButton(text: 'Tentar novamente', onTap: _init),
                ],
              )),
            );
          }

          return Column(
            children: store.categories.map((c) => CategorySection(category: c)).toList(),
          );
        }),
      ],
    );
  }

  @override
  void dispose() {
    store.reset();
    super.dispose();
  }
}
