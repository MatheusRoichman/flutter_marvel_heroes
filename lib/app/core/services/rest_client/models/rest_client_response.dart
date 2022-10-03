// Response of a request made by the REST client
class RestClientResponse<T> {
  // Data of the response
  T? data;

  // HTTP status code of the response. Ex: 200, 404, 500, etc.
  int? statusCode;

  // Message of the status. Ex: OK (200), Not Found (404), Internal Server Error (500), etc.
  String? statusMessage;

  RestClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
