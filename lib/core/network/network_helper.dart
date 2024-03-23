part of 'network.dart';

class NetworkHelper {
  late final Dio _dio;

  NetworkHelper._() : _dio = _configureDio();

  static final NetworkHelper instance = NetworkHelper._();

  factory NetworkHelper() => instance;

  static Dio _configureDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: WEATHER_BASE_URL,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5),
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    var response = await _dio.get(endPoint, queryParameters: params);
    return response;
  }
}
