import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/app_bar/main_app_bar.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_widget.dart';
import 'package:flutter_marvel_heroes/app/core/components/typography/typography.dart';
import 'package:flutter_marvel_heroes/app/core/utils/constants.dart';
import 'package:flutter_marvel_heroes/app/modules/home/components/characters_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> testList = [
      const CardWidget(title: 'Homem Aranha', subtitle: 'Peter Parker', imageUrl: '${Assets.images}/spider_man.png'),
      const CardWidget(title: 'Pantera Negra', subtitle: "T'Challa", imageUrl: '${Assets.images}/black_panther.png'),
      const CardWidget(title: 'Homem de Ferro', subtitle: 'Tony Stark', imageUrl: '${Assets.images}/iron_man.png'),
    ];

    return SafeArea(
      child: Scaffold(
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
                  CharactersSection(
                    title: 'Heróis',
                    children: testList,
                  ),
                  CharactersSection(
                    title: 'Vilões',
                    children: testList,
                  ),
                  CharactersSection(
                    title: 'Anti-heróis',
                    children: testList,
                  ),
                  CharactersSection(
                    title: 'Alienígenas',
                    children: testList,
                  ),
                  CharactersSection(
                    title: 'Humanos',
                    children: testList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
