import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/image_asset.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/svg_asset.dart';
import 'package:flutter_marvel_heroes/app/modules/entry/components/characters/caracteristic_card.dart';
import 'package:flutter_marvel_heroes/app/modules/entry/components/characters/character_abilities_section.dart';

import '../../../core/components/app_bar/dark_translucid_app_bar.dart';
import '../../../core/models/ability_model.dart';
import '../../../core/models/film_model.dart';
import '../../../core/utils/constants.dart';
import '../components/characters/caracteristics_list.dart';
import '../components/characters/character_films_section.dart';
import '../components/characters/character_profile_header.dart';

class CharacterPage extends StatefulWidget {
  final int characterId;

  const CharacterPage({super.key, required this.characterId});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  List<Ability> abilities = [
    Ability(name: "Força", level: 32),
    Ability(name: "Inteligência", level: 29),
    Ability(name: "Agilidade", level: 41),
    Ability(name: "Resistência", level: 27),
    Ability(name: "Velocidade", level: 35),
  ];
  int maxAbilityLevel = 44;

  List<Film> testFilmsList = [
    Film(id: 1, name: "", releaseYear: 2018, description: "", bannerUrl: "civil_war.png"),
    Film(id: 1, name: "", releaseYear: 2018, description: "", bannerUrl: "black_panther_film.png"),
    Film(id: 1, name: "", releaseYear: 2018, description: "", bannerUrl: "avengers_endgame.png"),
  ];

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUICustomOverlayStyle.transparent);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: ThemeColors.primaryBlack,
        extendBodyBehindAppBar: true,
        appBar: DarkTranslucidAppBar(),
        body: ListView(
          children: [
            Stack(children: [
              ImageAsset(
                path: '${Assets.images}/spider_man.png',
                width: screenSize.width,
                height: screenSize.height * 0.8,
                fit: BoxFit.fill,
              ),
              Container(
                height: screenSize.height * 0.8,
                decoration: const BoxDecoration(
                  gradient: ThemeColors.gradientBlack,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: screenSize.height * 0.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CharacterProfileHeader(
                          realName: "Peter Parker",
                          characterName: "Homem-Aranha",
                        ),
                        const SizedBox(height: 48),
                        const CaracteristicsList(
                          children: [
                            CaracteristicCard(
                                icon: SvgAsset(
                                  path: '${Assets.icons}/age.svg',
                                  width: 10,
                                  height: 20,
                                  color: ThemeColors.primaryWhite,
                                ),
                                text: "30 anos"),
                            CaracteristicCard(
                                icon: SvgAsset(
                                  path: '${Assets.icons}/weight.svg',
                                  width: 10,
                                  height: 20,
                                  color: ThemeColors.primaryWhite,
                                ),
                                text: "78kg"),
                            CaracteristicCard(
                                icon: SvgAsset(
                                  path: '${Assets.icons}/height.svg',
                                  width: 10,
                                  height: 20,
                                  color: ThemeColors.primaryWhite,
                                ),
                                text: "1.80m"),
                            CaracteristicCard(
                                icon: SvgAsset(
                                  path: '${Assets.icons}/universe.svg',
                                  width: 10,
                                  height: 20,
                                  color: ThemeColors.primaryWhite,
                                ),
                                text: "Terra 616")
                          ],
                        ),
                        const SizedBox(height: 24),
                        CharacterAbilitiesSection(abilities: abilities, maxAbilityLevel: maxAbilityLevel)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 48),
                    child: CharacterFilmsSection(films: testFilmsList),
                  ),
                ],
              ),
            ]),
          ],
        ));
  }
}
