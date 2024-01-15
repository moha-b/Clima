import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
      baseUrl: dotenv.get('WEATHER_BASE_URL'),
      receiveDataWhenStatusError: true,
    );
  }
}
