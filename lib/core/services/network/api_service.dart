import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Response> get(
      {required String endPoint, Map<String, dynamic>? params}) async {
    var response = await _dio.get(endPoint, queryParameters: params);
    return response;
  }
}
