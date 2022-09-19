class HttpResult {
  bool isSuccess;
  int statusCode;
  dynamic response;

  HttpResult({
    this.isSuccess = false,
    required this.statusCode,
    required this.response,
  });
}
