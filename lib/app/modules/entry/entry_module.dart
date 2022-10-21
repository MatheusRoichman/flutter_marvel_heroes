import 'package:flutter_modular/flutter_modular.dart';

import 'pages/character_page.dart';
import 'pages/home_page.dart';

class EntryModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
        // ChildRoute('/characters/categories/:category_name',
        //     child: (_, args) => CategoryPage(
        //           category: args.params['category_name']!,
        //         )),
        ChildRoute('/characters/:character_id',
            child: (_, args) => CharacterPage(
                  characterId: int.parse(args.params['character_id']),
                ),
            transition: TransitionType.fadeIn),
      ];
}
