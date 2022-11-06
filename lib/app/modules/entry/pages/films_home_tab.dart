import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/buttons/primary_button.dart';
import '../../../core/components/card/card_grid.dart';
import '../../../core/components/typography/typography.dart';
import '../../../core/stores/films_store.dart';
import '../../../core/utils/constants.dart';

class FilmsHomeTab extends StatefulWidget {
  const FilmsHomeTab({super.key});

  @override
  State<FilmsHomeTab> createState() => _FilmsHomeTabState();
}

class _FilmsHomeTabState extends State<FilmsHomeTab> {
  final store = Modular.get<FilmsStore>();

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    await store.getFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Escolha o seu filme',
              style: TTypography.homeTitle.merge(
                const TextStyle(color: ThemeColors.primaryDark),
              )),
          const SizedBox(height: 30),
          Observer(builder: (_) {
            if (store.state == FilmsState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (store.state == FilmsState.error) {
              return Center(
                  child: Column(
                children: [
                  const Text('Erro ao carregar filmes'),
                  const SizedBox(height: 10),
                  PrimaryButton(text: 'Tentar novamente', onTap: _init),
                ],
              ));
            }
            return CardGrid(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 230,
              itemCount: store.films.length,
              itemBuilder: (context, index) {
                final film = store.films[index];
                return CardWidget(
                  width: 165,
                  height: 230,
                  imageUrl: '${Assets.images}/${film.imageUrl}',
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
