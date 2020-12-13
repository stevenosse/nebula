import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info/package_info.dart';

class DioWrapper {
  Dio _dio;
  BaseOptions _options;

  /// The navigatorKey will further be used to perform redirections
  /// Example:
  ///   `navigatorKey.currentState.push(...)`
  /// Useful if you need for example to redirect a user back to
  /// the login page after a 401 redirection from the API
  ///
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AndroidDeviceInfo androidDeviceInfo;
  PackageInfo packageInfo;

  Future<void> init() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    androidDeviceInfo = await deviceInfo.androidInfo;
    packageInfo = await PackageInfo.fromPlatform();

  }

  DioWrapper() {
    _options = BaseOptions(
      baseUrl: DotEnv().env["ENDPOINT"],
      contentType: "application/json",
      headers: {
        "Accept": "application/json",
        "X-Device-UDID": "${androidDeviceInfo.id}",
        "X-Device-OS": "Android",
        "X-Device-OS-Version": "${androidDeviceInfo.version}",
        "X-Device-Manufacturer": "${androidDeviceInfo.manufacturer}",
        "X-Device-Model": "${androidDeviceInfo.model}",
        "X-Device-FCM-Token": "", // TODO: get firebase token
        "X-Device-App-Version": "${packageInfo.version}",
      },
    );
    _dio = Dio(_options);
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

  Future post(route, {params}) {
    return _dio.post(route, data: params);
  }

  Future put(route, {params}) {
    return _dio.put(route, data: params);
  }

  Future get(route, {bool useBase = false}) {
    if (useBase)
      return _dio.get(route);
    else
      return Dio().get(route);
  }

  Future delete(route) {
    return _dio.delete(route);
  }
}

final DioWrapper dioWrapper = DioWrapper();
