import 'package:flutter_marvel_heroes/app/modules/character/characters_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/repositories/character_repository.dart';
import '../../core/stores/characters_store.dart';
import 'pages/home_page.dart';

class EntryModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => CharacterRepositoryImpl(i.get())),
        Bind.lazySingleton((i) => CharactersStore(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
        ModuleRoute('/characters/', module: CharactersModule(), transition: TransitionType.fadeIn),
      ];
}
