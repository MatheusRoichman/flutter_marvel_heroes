import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_marvel_heroes/app/core/components/app_bar/main_app_bar.dart';
import 'package:flutter_marvel_heroes/app/core/components/card/card_widget.dart';
import 'package:flutter_marvel_heroes/app/core/components/typography/typography.dart';
import 'package:flutter_marvel_heroes/app/core/utils/constants.dart';
import 'package:flutter_marvel_heroes/app/modules/entry/components/category_section.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/scaffold/main_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUICustomOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> testList = [
      CardWidget(
          title: 'Homem Aranha',
          subtitle: 'Peter Parker',
          imageUrl: '${Assets.images}/spider_man.png',
          onTap: () => Modular.to.pushNamed('/characters/1'),
          gradient: ThemeColors.gradientDark),
      CardWidget(
          title: 'Pantera Negra',
          subtitle: "T'Challa",
          imageUrl: '${Assets.images}/black_panther.png',
          onTap: () => Modular.to.pushNamed('/characters/2'),
          gradient: ThemeColors.gradientDark),
      CardWidget(
          title: 'Homem de Ferro',
          subtitle: 'Tony Stark',
          imageUrl: '${Assets.images}/iron_man.png',
          onTap: () => Modular.to.pushNamed('/characters/3'),
          gradient: ThemeColors.gradientDark),
    ];

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
                CategorySection(
                  category: 'hero',
                  title: 'Heróis',
                  children: testList,
                ),
                CategorySection(
                  category: 'villain',
                  title: 'Vilões',
                  children: testList,
                ),
                CategorySection(
                  category: 'antihero',
                  title: 'Anti-heróis',
                  children: testList,
                ),
                CategorySection(
                  category: 'alien',
                  title: 'Alienígenas',
                  children: testList,
                ),
                CategorySection(
                  category: 'human',
                  title: 'Humanos',
                  children: testList,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
