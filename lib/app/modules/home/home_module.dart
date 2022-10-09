import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
        // ChildRoute('/:category_id',
        //     child: (_, args) => CategoryPage(
        //           category: args.params['category_id']!,
        //         )),
        // ChildRoute(
        //   '/:character_id',
        //   child: (_, args) => CharacterPage(
        //     characterId: args.params['character_id']!,
        //   ),
        // )
      ];
}
