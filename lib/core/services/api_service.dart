import 'package:dio/dio.dart';
import 'package:elemental/core/constant/apis.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  Future<Map<String, dynamic>> get({
    required String endPoint,
    required Map<String, dynamic> parameters,
  }) async {
    parameters['appid'] = Api.key;
    try {
      Response response = await _dio.get(endPoint, queryParameters: parameters);
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
