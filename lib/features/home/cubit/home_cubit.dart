import 'package:elemental/core/constant/constants.dart';
import 'package:elemental/core/helper/functions.dart';
import 'package:elemental/core/utils/app_images.dart';
import 'package:elemental/features/home/data/model/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository repository;
  HomeCubit(this.repository) : super(HomeLoadingState());

  getTodayWeather({
    required double? latitude,
    required double? longitude,
  }) async {
    final data = await repository.getTodayWeather(latitude, longitude);
    try {
      data.fold((l) {
        print(l.errorMessage);
        emit(HomeErrorState(error: l.errorMessage));
      }, (weather) {
        isNight = isNightTime(weather.sys.sunrise, weather.sys.sunset);
        emit(
          HomeSuccessState(
            weatherData: weather,
            todayDate: convertTimeToReadableDate(weather.time),
            temperature: convertTemperatureToCelsius(weather.temperature),
            weatherImage: getImagePath(weather.weatherState),
          ),
        );
      });
    } catch (e) {
      print("/////////////////////////////////////////////\n $e");
    }
  }
}
