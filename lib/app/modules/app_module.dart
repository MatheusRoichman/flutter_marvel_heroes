import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/repositories/character_repository.dart';
import '../core/services/rest_client/rest_client.dart';
import '../core/utils/constants.dart';
import 'entry/entry_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory<Dio>((i) => Dio()),
    Bind.factory<RestClientService>((i) => DioRestClient(EnvVars.baseURL, i.get())),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: EntryModule()),
  ];
}