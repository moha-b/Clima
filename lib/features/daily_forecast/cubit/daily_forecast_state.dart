part of 'daily_forecast_cubit.dart';

abstract class DailyForecastState extends Equatable {
  const DailyForecastState();

  @override
  List<Object> get props => [];
}

class DailyForecastInitial extends DailyForecastState {}

class DailyForecastLoaded extends DailyForecastState {
  final List<DailyForecast> forecast;

  const DailyForecastLoaded(this.forecast);
}

class DailyForecastError extends DailyForecastState {
  final String errorMessage;

  const DailyForecastError(this.errorMessage);
}
