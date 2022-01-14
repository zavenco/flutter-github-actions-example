import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ci_test/common/rest_client/rest_client.dart';
import 'package:flutter_ci_test/data/remote/model/remote_post.dart';
import 'package:flutter_ci_test/log.dart';

class RestClientDio implements RestClient {
  RestClientDio({required String baseUrl}) : _baseUrl = baseUrl {
    _initDio();
    _initInterceptors();
  }

  late Dio _dio;
  late BaseOptions? _options;
  final String _baseUrl;

  void _initDio() {
    _options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    _dio = Dio(_options);
  }

  void _initInterceptors() {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        Log.i(
            "${options.method} ${options.uri}\nHeaders: ${const JsonEncoder.withIndent('  ').convert(options.headers)}\nContent type: ${options.contentType}\n\nBody:\n${const JsonEncoder.withIndent('  ').convert(options.data)}");
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        Log.i(
            "${response.statusCode} ${response.statusMessage} from ${response.requestOptions.uri}\nHeaders:\n${response.headers}\nResponse:\n${const JsonEncoder.withIndent('  ').convert(response.data)}");
        return handler.next(response);
      },
      onError: (DioError e, ErrorInterceptorHandler handler) async {
        Log.e(
            "${e.response?.statusCode} ${e.response?.statusMessage} from ${e.requestOptions.uri}\nHeaders:\n${e.response?.headers}\nResponse:\n${const JsonEncoder.withIndent('  ').convert(e.response?.data)}",
            e);
        return handler.next(e);
      },
    ));
  }

  @override
  Future<RemotePost> getPost(int id) async {
    try {
      final Response response = await _dio.get('/posts/$id');
      return RemotePost.fromJson(response.data);
    } catch (e) {
      Log.e(e);
      rethrow;
    }
  }

  @override
  Future<List<RemotePost>> getPosts() async {
    try {
      final Response response = await _dio.get('/posts');
      final list = <RemotePost>[];
      for (final post in response.data) {
        list.add(RemotePost.fromJson(post));
      }
      return list;
    } catch (e) {
      Log.e(e);
      rethrow;
    }
  }
}