import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nebula/core/utils/constants.dart';

class Networker {
  Dio _dio;
  /// The navigatorKey will further be used to perform redirections
  /// Example:
  ///   `navigatorKey.currentState.push(...)`
  /// Useful if you need for example to redirect a user back to 
  /// the login page after a 401 redirection from the API
  /// 
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Networker() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.endpoint,
        contentType: "application/json",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError error) {
          /// Handle API errors here
        },
        onRequest: (RequestOptions options) async {
          /// Inject headers or dynamic params to your query here
        },
      ),
    );
  }

  getDioInstance() {
    return this._dio;
  }

  Future post(route, {params}) {
    return _dio.post(route, data: params);
  }

  Future put(route, {params}) {
    return _dio.put(route, data: params);
  }

  Future get(route) {
    return _dio.get(route);
  }

  Future delete(route) {
    return _dio.delete(route);
  }
}

final Networker worker = Networker();
