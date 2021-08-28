// ignore_for_file: file_names

class WebserviceResponse {
  int statusCode;
  Map<dynamic, dynamic> headers;
  Map<String, dynamic> responseBody;
  bool isError;
  String? errorResponse;
  WebserviceResponse(this.statusCode, this.headers, this.responseBody,
      this.isError, this.errorResponse);
}
