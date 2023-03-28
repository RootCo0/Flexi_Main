import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flexi_app/core/local/cache_helper.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';

import 'intersiptor_log.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioManager {
  Dio? _dio = Dio();

  List<Interceptor>? interceptors;

  DioManager({
    this.interceptors,
  }) {
    _dio!
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json',
        "Accept": "application/json",
        'Authorization': "Bearer ${CacheHelper.getData(key: "token")}",
        'zoneId':  "${CacheHelper.getData(key: "zoneId")}"
      };
    final options = CacheOptions(
      // A default store is required for interceptor.
      store: MemCacheStore(),
      // Default.
      policy: CachePolicy.request,
      // Optional. Returns a cached response on error but for statuses 401 & 403.
      hitCacheOnErrorExcept: [401, 403],
      // Optional. Overrides any HTTP directive to delete entry past this duration.
      // maxStale: const Duration(days: 7),
      // Default. Allows 3 cache sets and ease cleanup.
      priority: CachePriority.normal,
      // Default. Body and headers encryption with your own algorithm.
      cipher: null,
      // Default. Key builder to retrieve requests.
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      // Default. Allows to cache POST requests.
      // Overriding [keyBuilder] is strongly recommended.
      allowPostMethod: false,
    );

    if (interceptors?.isNotEmpty ?? false) {
      // interceptors?.addAll(
      //     DioCacheManager(CacheConfig(baseUrl: "http://70.37.96.50:92/"))
      //         .interceptor);

      _dio?.interceptors.addAll(interceptors!);
      _dio?.interceptors.add(DioCacheInterceptor(options: options));
    }
    if (kDebugMode) {
      // interceptors?.add(
      //     DioCacheManager(CacheConfig(baseUrl: "http://70.37.96.50:92/"))
      //         .interceptor);

      _dio?.interceptors.add(InterceptorLogs());
      _dio?.interceptors.add(DioCacheInterceptor(options: options));
    }
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio?.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
       return response?.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (error) {
      if (error.toString() != "") {
        showToast(error.toString(), true, false);
      }
      throw SocketException(error.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } on DioError catch (error) {
      if (error.type == DioErrorType.response) {
        // //  showToast(error.toString(), true);
        throw (error.response!.data);
      }
      if (error.type == DioErrorType.connectTimeout) {
        logger.d('Server is not reachable');
        showToast("Server is not reachable", false, false);
        throw TimeoutException(
            "Server is not reachable. Please verify your internet connection and try again");
      }

      if (error.type == DioErrorType.receiveTimeout) {
        logger.d('unable to connect to the server');
        showToast("unable to connect to the server", false, false);
        throw TimeoutException("unable to connect to the server");
      }

      if (error.type == DioErrorType.other) {
        if (error.message.contains('SocketException')) {
          showToast("connection lost", false, false);
          throw TimeoutException('connection lost');
        }
      }
      logger.d(error);
    } catch (error) {
      logger.d(error);
    }
  }

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio!.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio!.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> uploadFiles(
    String url, {
    required File file,
  }) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    try {
      final Response response = await _dio!.post(url,
          data: formData,
          options: Options(
              validateStatus: (int? status) {
                return true;
              },
              contentType: "multipart/form-data"));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

void showToast(String text, bool webShowClose, bool success) {
  Fluttertoast.showToast(
      webShowClose: webShowClose,
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: success ? ColorManager.primaryColor : ColorManager.error,
      textColor: Colors.white,
      fontSize: 16.0);
}
