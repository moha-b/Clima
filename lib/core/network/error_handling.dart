part of 'network.dart';

class ErrorHandler implements Exception {
  Failure? failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
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
