import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_marvel_heroes/app/core/components/app_bar/main_app_bar.dart';
import 'package:flutter_marvel_heroes/app/core/utils/constants.dart';
import 'package:flutter_marvel_heroes/app/modules/entry/pages/films_home_tab.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/scaffold/main_scaffold.dart';
import '../../../core/components/typography/typography.dart';
import '../../../core/stores/characters_store.dart';
import '../components/home_bottom_navigation_bar.dart';
import 'characters_home_tab.dart';

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
  }

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const CharactersHomeTab(),
    const FilmsHomeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: MainScaffold(
            appBar: MainAppBar(),
            bottomNavigationBar: HomeBottomNavigationBar(
              selectedIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bem vindo ao Marvel Heroes',
                        style: TTypography.homeSubtitle.merge(
                          const TextStyle(color: ThemeColors.primaryGrey),
                        )),
                    const SizedBox(height: 8),
                    _widgetOptions.elementAt(_selectedIndex),
                  ],
                ),
              ),
            )));
  }
}
