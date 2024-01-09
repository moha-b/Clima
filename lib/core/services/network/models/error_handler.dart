import 'package:clima/core/extensions/network_response_extension.dart';
import 'package:clima/core/global/network_response.dart';
import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      // default error
      failure = NetworkResponse.DEFAULT.getMessage();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return NetworkResponse.CONNECT_TIMEOUT.getMessage();
    case DioExceptionType.sendTimeout:
      return NetworkResponse.SEND_TIMEOUT.getMessage();
    case DioExceptionType.receiveTimeout:
      return NetworkResponse.RECIEVE_TIMEOUT.getMessage();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.data["message"] ?? "");
      } else {
        return NetworkResponse.DEFAULT.getMessage();
      }
    case DioExceptionType.cancel:
      return NetworkResponse.CANCEL.getMessage();
    default:
      return NetworkResponse.DEFAULT.getMessage();
  }
}
