import '../models/film_model.dart';
import '../models/response_exception.dart';
import '../services/rest_client/rest_client.dart';
import '../utils/utils.dart';

abstract class FilmsRepository {
  Future<List<Film>> getFilms();
  Future<Film> getFilmById(int id);
  Future<List<Film>> getFilmsByIds(List<int> ids);
}

class FilmsRepositoryImpl implements FilmsRepository {
  final RestClientService _client;

  FilmsRepositoryImpl(this._client);

  @override
  Future<List<Film>> getFilms() async {
    try {
      final response = await _client.get('/films');

      if (response.statusCode == 200) {
        return response.data.map<Film>((c) => Film.fromMap(c)).toList();
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
  Future<Film> getFilmById(int id) async {
    try {
      final response = await _client.get('/films/$id');

      if (response.statusCode == 200) {
        return Film.fromMap(response.data);
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
  Future<List<Film>> getFilmsByIds(List<int> ids) async {
    try {
      String queryParams = buildQueryParams({
        'id': ids,
      });

      final response = await _client.get('/films?$queryParams');

      if (response.statusCode == 200) {
        return response.data.map<Film>((c) => Film.fromMap(c)).toList();
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
