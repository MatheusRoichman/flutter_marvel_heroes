import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/card/card_list.dart';
import '../../../core/components/card/card_widget.dart';
import '../../../core/components/typography/typography.dart';
import '../../../core/models/film_model.dart';
import '../../../core/utils/constants.dart';
import '../stores/character_details_store.dart';

class CharacterFilmsSection extends StatefulWidget {
  final List<int> films;
  const CharacterFilmsSection({super.key, required this.films});

  @override
  State<CharacterFilmsSection> createState() => _CharacterFilmsSectionState();
}

class _CharacterFilmsSectionState extends State<CharacterFilmsSection> {
  final store = Modular.get<CharacterDetailsStore>();

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    await store.getFilmsByIds(widget.films);
  }

  Future<void> _showDialog(BuildContext context, Film film) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        title: Text(film.name, style: TTypography.cardTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Filme de ${film.releaseYear.toString()}', style: TTypography.description),
            const SizedBox(height: 16),
            Text(film.description, style: TTypography.description),
          ],
        ),
      ),
    );
  }

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
        Observer(builder: (context) {
          if (store.filmsState == FilmsState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.filmsState == FilmsState.error) {
            return const Center(child: Text("Erro ao carregar os filmes"));
          }

          return CardList(
              children: store.films
                  .map((film) => CardWidget(
                        imageUrl: "${Assets.images}/${film.imageUrl}",
                        onTap: () {
                          _showDialog(context, film);
                        },
                      ))
                  .toList());
        }),
      ],
    );
  }
}
