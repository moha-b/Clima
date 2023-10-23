import 'dart:io';

import 'package:dio/dio.dart';

abstract class IErrorHandler {
  final String message;

  IErrorHandler(this.message);
}

class ServerFailure extends IErrorHandler {
  ServerFailure(String errorMessage) : super(errorMessage);

  factory ServerFailure.handel(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout with the Server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Sending Timeout with the Server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receiving Timeout with the Server");
      case DioExceptionType.connectionError:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode, dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          return ServerFailure('Unknown');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Oops! There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      final errorMessage =
          response['error']['message'] as String? ?? 'Unknown Error';
      return ServerFailure(errorMessage);
    } else if (statusCode == 404) {
      return ServerFailure(
          'Your request was not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please try again later');
    } else {
      return ServerFailure('Oops! There was an Error, Please try again');
    }
  }
}
