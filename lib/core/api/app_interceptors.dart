import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_end_points.dart';
import 'package:movies_app/core/utils/app_constants.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.baseUrl = ApiEndPoints.baseUrl;
    // options.headers = {
    //   AppConstants.contentType: AppConstants.applicationJson,
    // };
    options
      ..baseUrl = ApiEndPoints.baseUrl
      ..queryParameters['api_key'] = AppConstants.apiKey
      ..headers[AppConstants.contentType] = AppConstants.applicationJson;
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
