part of 'daily_forecast_cubit.dart';

@immutable
abstract class DailyForecastState {}

class DailyForecastInitial extends DailyForecastState {}

class DailyForecastSuccess extends DailyForecastState {
  final DailyWeatherModel dailyWeather;

  DailyForecastSuccess({required this.dailyWeather});
}

class DailyForecastFailure extends DailyForecastState {
  final String message;

  DailyForecastFailure(this.message);
}
