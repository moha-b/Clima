part of 'detailed_forecast_cubit.dart';

abstract class DetailedForecastState extends Equatable {
  const DetailedForecastState();

  @override
  List<Object> get props => [];
}

class DetailedForecastInitial extends DetailedForecastState {}

class DetailsForecastSuccess extends DetailedForecastState {
  final List<DailyForecast> dailyForecast;
  final List<HourlyForecast> hourlyForecast;
  const DetailsForecastSuccess(
      {required this.dailyForecast, required this.hourlyForecast});
}

class HourlyForecastState extends DetailedForecastState {
  const HourlyForecastState();
}

class DetailedForecastError extends DetailedForecastState {
  final String errorMessage;

  const DetailedForecastError(this.errorMessage);
}
