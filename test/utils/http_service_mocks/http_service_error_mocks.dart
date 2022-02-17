import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_app/core/domain/services/http_service.dart';

abstract class HttpErrorMock implements HttpService {
  final int _httpStatus;
  HttpErrorMock(int status) : _httpStatus = status;

  @override
  Future<Response<String>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return Response(
        data: null,
        statusCode: _httpStatus,
        requestOptions: RequestOptions(path: ""));
  }
}

class HttpErrorBadRequestMock extends HttpErrorMock {
  HttpErrorBadRequestMock() : super(HttpStatus.badRequest);
}
