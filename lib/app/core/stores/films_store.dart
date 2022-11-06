import 'package:flutter_marvel_heroes/app/core/models/film_model.dart';
import 'package:flutter_marvel_heroes/app/core/repositories/films_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/response_exception.dart';

part 'films_store.g.dart';

class FilmsStore = _FilmsStoreBase with _$FilmsStore;

enum FilmsState {
  initial,
  loading,
  done,
  error,
}

abstract class _FilmsStoreBase with Store {
  final FilmsRepository _repository;

  _FilmsStoreBase(this._repository);

  @readonly
  FilmsState _state = FilmsState.initial;

  @readonly
  ObservableList<Film> _films = ObservableList.of([]);

  @action
  Future<void> getFilms() async {
    try {
      _state = FilmsState.loading;

      final response = await _repository.getFilms();

      _films.clear();

      _films.addAll(response);

      _state = FilmsState.done;
    } on ResponseException catch (_) {
      _state = FilmsState.error;
    }
  }
}
