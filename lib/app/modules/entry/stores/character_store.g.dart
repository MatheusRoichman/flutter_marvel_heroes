// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on _CharacterStoreBase, Store {
  late final _$_stateAtom =
      Atom(name: '_CharacterStoreBase._state', context: context);

  CharacterState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  CharacterState get _state => state;

  @override
  set _state(CharacterState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_charactersAtom =
      Atom(name: '_CharacterStoreBase._characters', context: context);

  List<Character> get characters {
    _$_charactersAtom.reportRead();
    return super._characters;
  }

  @override
  List<Character> get _characters => characters;

  @override
  set _characters(List<Character> value) {
    _$_charactersAtom.reportWrite(value, super._characters, () {
      super._characters = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
