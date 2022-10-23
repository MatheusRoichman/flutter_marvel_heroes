import 'package:flutter_marvel_heroes/app/modules/character/character_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';
import 'stores/characters_store.dart';

class EntryModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => CharactersStore(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
        // ChildRoute('/characters/categories/:category_name',
        //     child: (_, args) => CategoryPage(
        //           category: args.params['category_name']!,
        //         )),
        ModuleRoute('/character/', module: CharacterModule(), transition: TransitionType.fadeIn),
      ];
}
