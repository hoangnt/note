import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import 'package:my_note/common/network/interceptor.dart';
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

  Future<void> get({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    final queryString = Uri(queryParameters: params).query;
    final res = await _client.get(Uri.parse(
        "${BaseUrl.getServerUrl()}$endpoint${queryString != '' ? "?$queryString" : ''}"));
    debugPrint('API log request: ${res.statusCode} ${res.request}');
    debugPrint('API log params: $params');
  }
}
