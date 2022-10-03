import 'package:dio/dio.dart';

import 'rest_client_service.dart';
import 'models/rest_client_exception.dart';
import 'models/rest_client_response.dart';

// Implementation of the REST client service using the Dio package.
class DioRestClient implements RestClientService {
  // API base URL.
  final String _baseURL;

  // DIO instance to make the requests.
  late final Dio _dio;

  // Options for the DIO instance.
  late BaseOptions _baseOptions;

  DioRestClient(this._baseURL, this._dio) {
    _baseOptions = BaseOptions(
      baseUrl: _baseURL,
      followRedirects: false,
      receiveTimeout: 30000,
      connectTimeout: 30000,
      sendTimeout: 30000,
      validateStatus: (_) => true,
    );
    _dio.options = _baseOptions;
  }

  /* 
  All the methods (with the exception of .request()) follows the same pattern:
  1. Receive the following request options via function arguments:
    - URL (required);
    - Query Parameters;
    - Headers;
    - Content Type;
    - Response Type;
  2. Convert the RestClientResponseType to the DIO ResponseType.
  3. Make the request with the DIO instance
  4. Converts the DIO Response to a RestClientResponse and returns it.
  5. In case of error, Converts the DIO Error to a RestClientException and throws it.

  The .request() method is a bit different, since it receives the HTTP method as a string.
  */

  @override
  Future<RestClientResponse<T>> get<T>(
    // 1. Receives the request options via function arguments
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType = RestClientService.jsonContentType,
    RestClientResponseType? responseType,
  }) async {
    try {
      // 2. Converts the RestClientResponseType to the DIO ResponseType.
      final ResponseType convertedResponseType = _responseTypeEnumConverter(responseType);

      // 3. Makes the request with the DIO instance
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType,
          responseType: convertedResponseType,
          headers: headers,
        ),
      );

      // 4. Converts the DIO Response to a RestClientResponse and returns it.
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      // 5. Converts the DIO Error to a RestClientException and throws it.
      throw _dioErrorConverter(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType = RestClientService.jsonContentType,
    RestClientResponseType? responseType,
  }) async {
    try {
      final convertedResponseType = _responseTypeEnumConverter(responseType);

      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType,
          responseType: convertedResponseType,
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioErrorConverter(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType = RestClientService.jsonContentType,
    RestClientResponseType? responseType,
  }) async {
    try {
      final convertedResponseType = _responseTypeEnumConverter(responseType);

      final response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType,
          responseType: convertedResponseType,
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioErrorConverter(e);
    }
  }

  @override
  Future<RestClientResponse<T>> delete<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType = RestClientService.jsonContentType,
    RestClientResponseType? responseType,
  }) async {
    try {
      final convertedResponseType = _responseTypeEnumConverter(responseType);

      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType,
          responseType: convertedResponseType,
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioErrorConverter(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(
    String url, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType,
    RestClientResponseType? responseType,
  }) async {
    try {
      final ResponseType convertedResponseType = _responseTypeEnumConverter(responseType);
      final response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          contentType: contentType,
          responseType: convertedResponseType,
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioErrorConverter(e);
    }
  }

  // Convers the RestClientResponseType to the ResponseType that comes from the DIO package.
  ResponseType _responseTypeEnumConverter(RestClientResponseType? r) {
    if (r == null) {
      return ResponseType.json;
    }

    switch (r) {
      case RestClientResponseType.bytes:
        return ResponseType.bytes;
      case RestClientResponseType.plain:
        return ResponseType.plain;
      case RestClientResponseType.stream:
        return ResponseType.stream;
      case RestClientResponseType.json:
        return ResponseType.json;
    }
  }

  // Converts the DIO response type to a RestClientResponse.
  RestClientResponse<T> _dioResponseConverter<T>(Response response) {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  // Converts the DIO error type to a RestClientException.
  RestClientException _dioErrorConverter(DioError e) {
    return RestClientException(
      message: e.response?.statusMessage,
      statusCode: e.response?.statusCode,
      error: e.error,
      response: e.response?.data,
    );
  }
}
