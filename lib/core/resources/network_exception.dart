import 'package:dio/dio.dart';

class NetworkException with Exception {
  String message;
  NetworkException(DioError e) {
    if (e?.response == null) {
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
