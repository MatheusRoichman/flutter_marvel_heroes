// Exception thrown by the REST client itself.
class RestClientException<T> implements Exception {
  // Message detailing the exception.
  final String? message;

  // HTTP Status code of the response.
  final int? statusCode;

  // The error itself.
  final dynamic error;
  
  final T? response;

  RestClientException({
    this.message,
    this.statusCode,
    this.error,
    this.response,
  });

  @override
  String toString() {
    return 'RestClientException(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
