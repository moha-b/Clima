part of 'hourly_forecast_cubit.dart';

abstract class HourlyForecastState extends Equatable {
  const HourlyForecastState();

  @override
  List<Object> get props => [];
}

class HourlyForecastInitial extends HourlyForecastState {}

class HourlyForecastLoaded extends HourlyForecastState {
  final List<HourlyForecast> forecast;

  const HourlyForecastLoaded(this.forecast);
}

class HourlyForecastError extends HourlyForecastState {
  final String errorMessage;

  const HourlyForecastError(this.errorMessage);
}
