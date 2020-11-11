import 'package:dio/dio.dart';

/// Custom Exception
class NException implements Exception {
  String message;
  NException(e) {
    if (e is String)
      this.message = e;
    else if (e is DioError && e?.response == null) {
      // Assuming that if the response is null, it means the query could not reach the server.
      this.message = "Sorry, we are unable to connect to internet at this time.";
    } else {
      switch (e.response.statusCode) {
        /// handle separately each response code if needed.
        default:
          this.message = "Sorry, an error occured.";
          break;
      }
    }
  }
}
