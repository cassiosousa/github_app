import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_app/core/domain/services/http_service.dart';

import '../../fixtures/fixture_reader.dart';

abstract class HttpOkMock implements HttpService {
  final String _mockFileName;
  HttpOkMock(mockFileName) : _mockFileName = mockFileName;

  @override
  Future<Response<Map<String, dynamic>>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return Response(
        data: jsonDecode(fixture(_mockFileName)),
        statusCode: HttpStatus.ok,
        requestOptions: RequestOptions(path: ""));
  }
}

class HttpProfileRemoteMock extends HttpOkMock {
  HttpProfileRemoteMock() : super("profile");
}
