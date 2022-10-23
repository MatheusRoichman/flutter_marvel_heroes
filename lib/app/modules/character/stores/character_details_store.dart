import 'package:mobx/mobx.dart';

import '../../../core/models/character_model.dart';
import '../../../core/models/film_model.dart';
import '../../../core/models/response_exception.dart';
import '../../../core/repositories/character_repository.dart';
import '../../../core/repositories/films_repository.dart';

part '../../entry/stores/character_details_store.g.dart';

class CharacterDetailsStore = _CharacterDetailsStore with _$CharacterDetailsStore;

enum CharacterDetailsState {
  initial,
  loading,
  done,
  error,
}

enum FilmsState {
  initial,
  loading,
  done,
  error,
}

abstract class _CharacterDetailsStore with Store {
  final CharacterRepository _charactersRepository;
  final FilmsRepository _filmsRepository;

  _CharacterDetailsStore(this._charactersRepository, this._filmsRepository);

  @readonly
  CharacterDetailsState _characterDetailsState = CharacterDetailsState.initial;

  @readonly
  FilmsState _filmsState = FilmsState.initial;

  @readonly
  Character? _character;

  @readonly
  ObservableList<Film> _films = ObservableList.of([]);

  @action
  Future<void> getCharacterById(int id) async {
    try {
      _characterDetailsState = CharacterDetailsState.loading;

      final response = await _charactersRepository.getCharacterById(id);

      _character = response;

      _characterDetailsState = CharacterDetailsState.done;
    } on ResponseException {
      _characterDetailsState = CharacterDetailsState.error;
    }
  }

  @action
  Future<void> getFilmsByIds(List<int> id) async {
    try {
      _filmsState = FilmsState.loading;

      final response = await _filmsRepository.getFilmsByIds(id);

      _films.clear();

      _films.addAll(response);

      _filmsState = FilmsState.done;
    } on ResponseException {
      _filmsState = FilmsState.error;
    }
  }
}
