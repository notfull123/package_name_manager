import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;
    if (method == 'GET') {
      log("✈️ REQUEST[$method] => PATH: $uri");
    } else {
      log("✈️ REQUEST[$method] => PATH: $uri \n DATA: $data");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    if (kDebugMode) {
      print("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    if (kDebugMode) {
      print("⚠️ ERROR[$statusCode] => PATH: $uri");
    }
    return super.onError(err, handler);
  }
}
