part of 'hourly_forecast_cubit.dart';

abstract class DetailedForecastState extends Equatable {
  const DetailedForecastState();

  @override
  List<Object> get props => [];
}

class DetailedForecastInitial extends DetailedForecastState {}

class DetailsForecastSuccess extends DetailedForecastState {
  final Daily dailyForecast;
  final WeatherHourly hourlyForecast;
  final WeatherNewsModel article;
  const DetailsForecastSuccess(
      {required this.dailyForecast,
      required this.hourlyForecast,
      required this.article});
}

class HourlyForecastState extends DetailedForecastState {
  const HourlyForecastState();
}

class DetailedForecastError extends DetailedForecastState {
  final String errorMessage;

  const DetailedForecastError(this.errorMessage);
}
