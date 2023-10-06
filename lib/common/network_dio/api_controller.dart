import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_note/common/network_dio/interceptor.dart';
import 'package:my_note/common/network_dio/model/server_response.dart';
import 'package:my_note/config/base_url.dart';

class ApiController {
  static final ApiController _instance = ApiController._();
  ApiController._() {
    _dio = Dio(apiOption);
    _dio.interceptors.addAll([
      TokenInterceptor(),
      Interceptor1(),
      Interceptor2(),
      Interceptor3(),
      QueueInterceptor1(),
    ]);
  }
  factory ApiController() {
    return _instance;
  }

  late Dio _dio;
  final BaseOptions apiOption = BaseOptions(
    baseUrl: BaseUrl.getServerUrl(),
    connectTimeout: Duration(seconds: 10),
  );

  Future<ServerResponse> get({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    final res = await _dio.request(
      endpoint,
      queryParameters: params,
      options: Options(method: "GET"),
    );
    debugPrint('API log request: ${res.statusCode} ${res.realUri}');
    debugPrint('API log params: $params');
    return _handleResponse(res);
  }

  Future<ServerResponse> post({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    final res = await _dio.request(
      endpoint,
      data: params,
      options: Options(method: "POST"),
    );
    debugPrint('API log request: ${res.statusCode} ${res.realUri}');
    debugPrint('API log params: $params');
    return _handleResponse(res);
  }

  Future<ServerResponse> postWithFile({
    required String endpoint,
    required File file,
    Map<String, dynamic>? params,
  }) async {
    params?.addAll({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: file.path.split("/").last,
      ),
    });
    final res = await _dio.post(
      "${BaseUrl.getServerUrl()}$endpoint",
      data: params,
      options: Options(method: "POST"),
    );
    debugPrint('API log request: ${res.statusCode} ${res.realUri}');
    debugPrint('API log params: $params');
    return _handleResponse(res);
  }

  ServerResponse _handleResponse(Response response) {
    Map<String, dynamic>? jsonData = Map<String, dynamic>();
    try {
      jsonData = json.decode(response.data);
    } catch (e) {
      jsonData = null;
    }

    if (jsonData == null) {
      return ServerResponse(
        statusCode: response.statusCode ?? 999,
        message: "Có lỗi đã xảy ra",
      );
    }

    return ServerResponse(
      statusCode: response.statusCode ?? 999,
      data: jsonData["data"],
      message: jsonData["message"],
      paging: jsonData["paging"] != null
          ? Paging.fromJson(jsonData["paging"])
          : null,
    );
  }
}
