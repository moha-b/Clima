import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio getDio() {
    Dio dio = Dio(_getDioOptions());

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }

  BaseOptions _getDioOptions() {
    return BaseOptions(
      baseUrl: "https://api.open-meteo.com/v1",
      receiveDataWhenStatusError: true,
    );
  }
}
