import '../models/character_model.dart';
import '../models/response_exception.dart';
import '../services/rest_client/models/rest_client_exception.dart';
import '../services/rest_client/rest_client_service.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters({String? category});
  Future<Character> getCharacter(int id);
}

class CharacterRepositoryImpl implements CharacterRepository {
  final RestClientService _client;

  CharacterRepositoryImpl(this._client);

  @override
  Future<List<Character>> getCharacters({String? category}) async {
    try {
      final response = await _client.get('/characters?category=$category');

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
  Future<Character> getCharacter(int id) async {
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
}
