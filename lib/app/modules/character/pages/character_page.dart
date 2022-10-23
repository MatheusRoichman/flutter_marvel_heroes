import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/image_asset.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/svg_asset.dart';
import 'package:flutter_marvel_heroes/app/modules/entry/components/characters/caracteristic_card.dart';
import 'package:flutter_marvel_heroes/app/modules/entry/components/characters/character_abilities_section.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/app_bar/dark_translucid_app_bar.dart';
import '../../../core/components/typography/typography.dart';
import '../../../core/utils/constants.dart';
import '../../entry/components/characters/caracteristics_list.dart';
import '../../entry/components/characters/character_films_section.dart';
import '../../entry/components/characters/character_profile_header.dart';
import '../stores/character_details_store.dart';

class CharacterPage extends StatefulWidget {
  final int characterId;

  const CharacterPage({super.key, required this.characterId});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final store = Modular.get<CharacterDetailsStore>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUICustomOverlayStyle.transparent);

    _init();
  }

  void _init() async {
    await store.getCharacterById(widget.characterId);
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
            Observer(builder: (context) {
              if (store.characterDetailsState == CharacterDetailsState.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (store.characterDetailsState == CharacterDetailsState.error) {
                return const Center(child: Text("Erro ao carregar os dados"));
              }

              return Stack(children: [
                ImageAsset(
                  path: '${Assets.images}/${store.character!.imageUrl}',
                  width: screenSize.width,
                  height: screenSize.height * 0.8,
                  fit: BoxFit.cover,
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
                          CharacterProfileHeader(
                            realName: store.character!.realName,
                            characterName: store.character!.characterName,
                          ),
                          const SizedBox(height: 48),
                          CaracteristicsList(
                            children: [
                              CaracteristicCard(
                                  icon: const SvgAsset(
                                    path: '${Assets.icons}/age.svg',
                                    width: 10,
                                    height: 20,
                                    color: ThemeColors.primaryWhite,
                                  ),
                                  text: "${store.character!.age.toString()} anos"),
                              CaracteristicCard(
                                  icon: const SvgAsset(
                                    path: '${Assets.icons}/weight.svg',
                                    width: 10,
                                    height: 20,
                                    color: ThemeColors.primaryWhite,
                                  ),
                                  text: "${store.character!.weight.toStringAsFixed(1)}kg"),
                              CaracteristicCard(
                                  icon: const SvgAsset(
                                    path: '${Assets.icons}/height.svg',
                                    width: 10,
                                    height: 20,
                                    color: ThemeColors.primaryWhite,
                                  ),
                                  text: '${store.character!.height.toStringAsFixed(2)}m'),
                              CaracteristicCard(
                                  icon: const SvgAsset(
                                    path: '${Assets.icons}/universe.svg',
                                    width: 10,
                                    height: 20,
                                    color: ThemeColors.primaryWhite,
                                  ),
                                  text: store.character!.homePlanet)
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            store.character!.description,
                            style: TTypography.description.merge(const TextStyle(color: ThemeColors.primaryWhite)),
                          ),
                          CharacterAbilitiesSection(abilities: store.character!.abilities)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, bottom: 48),
                      child: CharacterFilmsSection(films: store.character!.films),
                    ),
                  ],
                ),
              ]);
            }),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    
    SystemChrome.setSystemUIOverlayStyle(SystemUICustomOverlayStyle.light);
  }
}
