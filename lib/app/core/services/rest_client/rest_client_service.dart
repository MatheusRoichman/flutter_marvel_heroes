import 'models/rest_client_response.dart';

enum RestClientResponseType {
  json,
  stream,
  bytes,
  plain,
}

// Abstract class that defines the methods that his implementations should have.
abstract class RestClientService {
  // Response content types.
  static const jsonContentType = 'application/json; charset=utf-8';
  static const formUrlEncodedContentType = 'application/x-www-form-urlencoded';
  static const textPlainContentType = 'text/plain';

  // Sends a GET request to the specified URL.
  Future<RestClientResponse<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType,
    RestClientResponseType? responseType,
  });

  // Sends a POST request to the specified URL.
  Future<RestClientResponse<T>> post<T>(String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType = RestClientService.jsonContentType,
    RestClientResponseType? responseType,
  });

  // Sends a PATCH request to the specified URL.
  Future<RestClientResponse<T>> patch<T>(String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType = RestClientService.jsonContentType,
    RestClientResponseType? responseType,
  });

  // Sends a DELETE request to the specified URL.
  Future<RestClientResponse<T>> delete<T>(String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType = RestClientService.jsonContentType,
    RestClientResponseType? responseType,
  });

  // Sends another type of request to the specified URL.
  Future<RestClientResponse<T>> request<T>(
    String url, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType,
    RestClientResponseType? responseType,
  });
}
