import 'package:dio/dio.dart';
import 'package:elemental/app/data/weather_model.dart';
import 'package:elemental/core/constant/apis.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Apis.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  Future<WeatherModel> fetchWeatherData({required String endPoint}) async {
    try {
      Response response = await _dio.get(endPoint + Apis.key);
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

}
