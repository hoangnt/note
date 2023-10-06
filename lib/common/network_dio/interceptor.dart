import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      Headers.contentTypeHeader: 'application/json',
      Headers.wwwAuthenticateHeader: 'Bearer token_here'
    });
    super.onRequest(options, handler);
  }
}

class Interceptor1 extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("concurency 1");
    await Future.delayed(Duration(seconds: 2));
    super.onRequest(options, handler);
  }
}

class Interceptor2 extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("concurency 2");
    await Future.delayed(Duration(seconds: 2));
    super.onRequest(options, handler);
  }
}

class Interceptor3 extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("concurency 3");
    await Future.delayed(Duration(seconds: 2));
    super.onRequest(options, handler);
  }
}

class QueueInterceptor1 extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("Queue 1");
    await Future.delayed(Duration(seconds: 2));
    super.onRequest(options, handler);
  }
}
