import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../../core/models/category_model.dart';
import '../../../core/models/character_model.dart';
import '../../../core/models/response_exception.dart';
import '../../../core/repositories/character_repository.dart';

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
  CharacterState _characterState = CharacterState.initial;

  @readonly
  CategoryState _categoryState = CategoryState.initial;

  @readonly
  Map<String, List<Character>> _characters = {
    'all': [],
  };

  @readonly
  List<Category> _categories = [
    Category(name: 'all', displayName: 'Outros'),
  ];

  @action
  Future<void> getCharacters({required String category}) async {
    try {
      _characterState = CharacterState.loading;

      final response = await _repository.getCharacters(category: category);

      _characters[category] = response;

      _characterState = CharacterState.done;
    } on ResponseException catch (_) {
      _characterState = CharacterState.error;

      return;
    }
  }

  @action
  Future<void> getCategories() async {
    try {
      _categoryState = CategoryState.loading;

      final response = await _repository.getCategories();

      _characters.addEntries(response.map((c) => MapEntry(c.name, [])));

      _categories = [...response, ..._categories].toSet().toList();

      _categoryState = CategoryState.done;
    } on ResponseException catch (_) {
      _categoryState = CategoryState.error;

      return;
    }
  }
}
