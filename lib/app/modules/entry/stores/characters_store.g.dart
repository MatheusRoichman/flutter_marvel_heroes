// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on _CharactersStoreBase, Store {
  late final _$_characterStateAtom =
      Atom(name: '_CharactersStoreBase._characterState', context: context);

  CharacterState get characterState {
    _$_characterStateAtom.reportRead();
    return super._characterState;
  }

  @override
  CharacterState get _characterState => characterState;

  @override
  set _characterState(CharacterState value) {
    _$_characterStateAtom.reportWrite(value, super._characterState, () {
      super._characterState = value;
    });
  }

  late final _$_categoryStateAtom =
      Atom(name: '_CharactersStoreBase._categoryState', context: context);

  CategoryState get categoryState {
    _$_categoryStateAtom.reportRead();
    return super._categoryState;
  }

  @override
  CategoryState get _categoryState => categoryState;

  @override
  set _categoryState(CategoryState value) {
    _$_categoryStateAtom.reportWrite(value, super._categoryState, () {
      super._categoryState = value;
    });
  }

  late final _$_charactersAtom =
      Atom(name: '_CharactersStoreBase._characters', context: context);

  Map<String, List<Character>> get characters {
    _$_charactersAtom.reportRead();
    return super._characters;
  }

  @override
  Map<String, List<Character>> get _characters => characters;

  @override
  set _characters(Map<String, List<Character>> value) {
    _$_charactersAtom.reportWrite(value, super._characters, () {
      super._characters = value;
    });
  }

  late final _$_categoriesAtom =
      Atom(name: '_CharactersStoreBase._categories', context: context);

  List<Category> get categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  List<Category> get _categories => categories;

  @override
  set _categories(List<Category> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('_CharactersStoreBase.getCharacters', context: context);

  @override
  Future<void> getCharacters({required String category}) {
    return _$getCharactersAsyncAction
        .run(() => super.getCharacters(category: category));
  }

  late final _$getCategoriesAsyncAction =
      AsyncAction('_CharactersStoreBase.getCategories', context: context);

  @override
  Future<void> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
