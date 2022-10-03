// Custom exception for REST client responses.
class ResponseException<T> implements Exception {
  // Data detailing the exception.
  T? data;

  // HTTP status code from the response.
  int? statusCode;

  ResponseException({
    required this.data,
    required this.statusCode,
  });

  @override
  String toString() => 'ResponseException(data: $data, statusCode: $statusCode)';
}