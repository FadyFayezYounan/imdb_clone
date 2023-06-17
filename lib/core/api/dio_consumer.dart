import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/core/api/status_code.dart';

import '../../app_injector.dart' as di;
import '../error/exceptions.dart';
import 'api_consumer.dart';
import 'api_end_points.dart';
import 'app_interceptors.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = ApiEndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false;
    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }
  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
      );

      return _handleResponseJson(response);
    } on DioError catch (error) {
      throw _handleDioError(error);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return _handleResponseJson(response);
    } on DioError catch (error) {
      throw _handleDioError(error);
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return _handleResponseJson(response);
    } on DioError catch (error) {
      throw _handleDioError(error);
    }
  }

  @override
  Future delete(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.delete(path, queryParameters: queryParameters);
      return _handleResponseJson(response);
    } on DioError catch (error) {
      throw _handleDioError(error);
    }
  }

  dynamic _handleResponseJson(Response response) {
    return jsonDecode(response.data.toString());
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(error.response?.data);
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException(error.response?.data);
          case StatusCode.notFound:
            throw NotFoundException(error.response?.data);
          case StatusCode.conflict:
            throw ConflictException(error.response?.data);
          case StatusCode.unProcessableEntity:
            throw UnProcessableEntityException(error.response?.data);
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
          default:
            throw const FetchDataException();
        }
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw const NoInternetException();
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioErrorType.connectionError:
        throw const ConnectionErrorException();
    }
  }
}
