import 'package:flutter_marvel_heroes/app/core/models/character_model.dart';
import 'package:flutter_marvel_heroes/app/core/models/response_exception.dart';
import 'package:flutter_marvel_heroes/app/core/repositories/character_repository.dart';
import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;

enum CharacterState {
  initial,
  loading,
  done,
  error,
}

abstract class _CharacterStoreBase with Store {
  final CharacterRepository _repository;

  _CharacterStoreBase(
    this._repository,
  );

  @readonly
  CharacterState _state = CharacterState.initial;

  @readonly
  List<Character> _characters = [];

  Future<void> getCharacters({String? category}) async {
    try {
      _state = CharacterState.loading;

      final response = await _repository.getCharacters();

      _characters = response;
    } on ResponseException catch (_) {
      _state = CharacterState.error;

      return;
    }
  }
}
