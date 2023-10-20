import 'package:elemental/app/data/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../core/helper/location_helper.dart';
import '../../core/services/api_service.dart';
import '../../core/utils/app_images.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.apiService) : super(AppInitial());
  ApiService apiService;
  late bool isNight;
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    emit(AppInitial());
    Position? position = await LocationHelper.determinePosition();
    latitude = position?.latitude;
    longitude = position?.longitude;
    // insurance
    await Future.delayed(const Duration(milliseconds: 100));
    getWeatherData();
  }

  getWeatherData() async {
    // fetch data
    try {
      WeatherModel weatherModel = await apiService.fetchWeatherData(
          endPoint: "?lat=$latitude&lon=$longitude");

      // emit
      emit(AppStarted(weatherModel));
    } catch (e) {
      emit(AppFailure(error: e.toString()));
    }
  }
}
