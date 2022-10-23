import '../models/category_model.dart';
import '../models/character_model.dart';
import '../models/response_exception.dart';
import '../services/rest_client/rest_client.dart';
import '../utils/utils.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters({required String category});
  Future<Character> getCharacterById(int id);
  Future<List<Category>> getCategories();
}

class CharacterRepositoryImpl implements CharacterRepository {
  final RestClientService _client;

  CharacterRepositoryImpl(this._client);

  @override
  Future<List<Character>> getCharacters({required String category}) async {
    try {
      String queryParams = buildQueryParams({
        'category': category,
      });

      final response = await _client.get('/characters?$queryParams');

      if (response.statusCode == 200) {
        return response.data.map<Character>((c) => Character.fromMap(c)).toList();
      }

      throw ResponseException(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on RestClientException catch (e) {
      throw ResponseException(
        data: e.error,
        statusCode: e.statusCode,
      );
    }
  }

  @override
  Future<Character> getCharacterById(int id) async {
    try {
      final response = await _client.get('/characters/$id');

      if (response.statusCode == 200) {
        return Character.fromMap(response.data);
      }

      throw ResponseException(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on RestClientException catch (e) {
      throw ResponseException(
        data: e.error,
        statusCode: e.statusCode,
      );
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    try {
      final response = await _client.get('/categories');

      if (response.statusCode == 200) {
        return response.data.map<Category>((c) => Category.fromMap(c)).toList();
      }

      throw ResponseException(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on RestClientException catch (e) {
      throw ResponseException(
        data: e.error,
        statusCode: e.statusCode,
      );
    }
  }
}
