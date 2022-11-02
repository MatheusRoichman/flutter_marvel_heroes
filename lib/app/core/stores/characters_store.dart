import 'dart:async';

import 'package:mobx/mobx.dart';

import '../models/category_model.dart';
import '../models/character_model.dart';
import '../models/response_exception.dart';
import '../repositories/character_repository.dart';

part 'characters_store.g.dart';

class CharactersStore = _CharactersStoreBase with _$CharactersStore;

enum CharacterState {
  initial,
  loading,
  done,
  error,
}

enum CategoryState {
  initial,
  loading,
  done,
  error,
}

abstract class _CharactersStoreBase with Store {
  final CharacterRepository _repository;

  _CharactersStoreBase(this._repository);

  @readonly
  ObservableMap<String, CharacterState> _charactersStates = ObservableMap.of({});

  @readonly
  CategoryState _categoryState = CategoryState.initial;

  @readonly
  ObservableMap<String, List<Character>> _characters = ObservableMap.of({
    'others': [],
  });

  @readonly
  ObservableList<Category> _categories = ObservableList.of([]);

  @action
  Future<void> getCharacters({required String category}) async {
    try {
      _charactersStates.update(
        category,
        (value) => CharacterState.loading,
        ifAbsent: () => CharacterState.loading,
      );

      final response = await _repository.getCharacters(category: category);

      _characters.update(
        category,
        (value) => response,
        ifAbsent: () => response,
      );

      _charactersStates.update(
        category,
        (value) => CharacterState.done,
        ifAbsent: () => CharacterState.done,
      );
    } on ResponseException catch (_) {
      _charactersStates.update(
        category,
        (value) => CharacterState.error,
        ifAbsent: () => CharacterState.error,
      );

      return;
    }
  }

  @action
  Future<void> getCategories() async {
    try {
      _categoryState = CategoryState.loading;

      final response = await _repository.getCategories();

      response.map((c) {
        _characters.update(
          c.name,
          (value) => _characters[c.name] ?? [],
          ifAbsent: () => [],
        );

        _charactersStates.update(
          c.name,
          (value) => CharacterState.initial,
          ifAbsent: () => CharacterState.initial,
        );
      });

      _categories.clear();

      _categories.addAll(response);

      _categoryState = CategoryState.done;
    } on ResponseException catch (_) {
      _categoryState = CategoryState.error;

      return;
    }
  }

  void reset() {
    _charactersStates.clear();

    _characters.clear();

    _categories.clear();

    _categoryState = CategoryState.initial;
  }
}
