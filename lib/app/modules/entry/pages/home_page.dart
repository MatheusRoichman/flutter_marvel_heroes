import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_marvel_heroes/app/core/components/app_bar/main_app_bar.dart';
import 'package:flutter_marvel_heroes/app/core/components/buttons/primary_button.dart';
import 'package:flutter_marvel_heroes/app/core/components/typography/typography.dart';
import 'package:flutter_marvel_heroes/app/core/utils/constants.dart';
import 'package:flutter_marvel_heroes/app/modules/entry/components/category_section.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/scaffold/main_scaffold.dart';
import '../../../core/models/category_model.dart';
import '../stores/characters_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<CharactersStore>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUICustomOverlayStyle.light);

    _init();
  }

  void _init() async {
    await store.getCategories();
  }

  void _retryGetCharacters() async {
    for (Category category in store.categories) {
      await store.getCharacters(category: category.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: MainAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bem vindo ao Marvel Heroes',
                    style: TTypography.homeSubtitle.merge(
                      const TextStyle(color: ThemeColors.primaryGrey),
                    )),
                const SizedBox(height: 8),
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
                    children:
                        store.categories.map((c) => CategorySection(category: c.name, title: c.displayName)).toList(),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
