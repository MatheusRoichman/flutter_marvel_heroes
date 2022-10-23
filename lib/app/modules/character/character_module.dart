import 'package:flutter_marvel_heroes/app/core/repositories/films_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/repositories/character_repository.dart';
import 'pages/character_page.dart';
import 'stores/character_details_store.dart';

class CharacterModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => CharacterRepositoryImpl(i.get())),
    Bind.lazySingleton((i) => FilmsRepositoryImpl(i.get())),
    Bind.lazySingleton((i) => CharacterDetailsStore(i.get(), i.get())),
  ];

  @override
  List<ModularRoute> get routes => [
      ChildRoute('/:id/', child: (_, args) => CharacterPage(characterId: int.parse(args.params['id']!))),
    ];
}