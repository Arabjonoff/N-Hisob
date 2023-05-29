class HttpResult{
  int statusCode;
  bool isSuccess;
  String status;
  dynamic result;
  HttpResult({
    required this.statusCode,
    required this.isSuccess,
    required this.result,
    this.status = '',
});
}