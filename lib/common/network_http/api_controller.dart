import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'package:my_note/common/network_http/interceptor.dart';
import 'package:my_note/common/network_http/model/server_response.dart';
import 'package:my_note/config/base_url.dart';

class ApiController {
  static final ApiController _instance = ApiController._();
  ApiController._();
  factory ApiController() => _instance;

  final Client _client = InterceptedClient.build(
    requestTimeout: Duration(seconds: 60),
    interceptors: [
      TokenInterceptor(),
    ],
  );

  Future<ServerResponse> get({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    final queryString = Uri(queryParameters: params).query;
    final res = await _client.get(
      Uri.parse(
          "${BaseUrl.getServerUrl()}$endpoint${queryString != '' ? "?$queryString" : ''}"),
    );
    debugPrint('API log request: ${res.statusCode} ${res.request}');
    debugPrint('API log params: $params');
    return _handleResponse(res);
  }

  Future<ServerResponse> post({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    final res = await _client.post(
      Uri.parse("${BaseUrl.getServerUrl()}$endpoint"),
      body: params,
    );
    debugPrint('API log request: ${res.statusCode} ${res.request}');
    debugPrint('API log params: $params');
    return _handleResponse(res);
  }

  Future<ServerResponse> put({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    final res = await _client.put(
      Uri.parse(BaseUrl.getServerUrl() + endpoint),
      body: params,
    );
    debugPrint('API log request: ${res.statusCode} ${res.request}');
    debugPrint('API log params: $params');
    return _handleResponse(res);
  }

  Future<void> putWithFile({
    required String endpoint,
    required String filePath,
    Map<String, String>? params,
  }) async {
    final _fileData = await MultipartFile.fromPath("file", filePath);

    MultipartRequest _request = MultipartRequest(
      "PUT",
      Uri.parse(BaseUrl.getServerUrl() + endpoint),
    );
    _request.headers.addAll({
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
    });
    _request.files.add(_fileData);
    _request.fields.addAll(params ?? {});

    final res = await _request.send();
    final resString = await res.stream.bytesToString();
    debugPrint('API log request: ${res.statusCode} ${res.request}');
    debugPrint('API log params: $params');
  }

  ServerResponse _handleResponse(Response response) {
    Map<String, dynamic>? jsonData = Map<String, dynamic>();
    try {
      jsonData = json.decode(response.body);
    } catch (e) {
      jsonData = null;
    }

    if (jsonData == null) {
      return ServerResponse(
        statusCode: response.statusCode,
        message: "Có lỗi đã xảy ra",
      );
    }

    return ServerResponse(
      statusCode: response.statusCode,
      data: jsonData["data"],
      message: jsonData["message"],
      paging: jsonData["paging"] != null
          ? Paging.fromJson(jsonData["paging"])
          : null,
    );
  }
}
