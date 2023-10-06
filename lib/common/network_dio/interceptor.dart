import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      Headers.contentTypeHeader: 'application/json',
      Headers.wwwAuthenticateHeader: 'Bearer token_here'
    });
    super.onRequest(options, handler);
  }
}
