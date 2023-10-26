part of 'forecast_5_days_cubit.dart';

abstract class Forecast5DaysState extends Equatable {
  const Forecast5DaysState();

  @override
  List<Object> get props => [];
}

class Forecast5DaysInitial extends Forecast5DaysState {}

class Forecast5DaysLoaded extends Forecast5DaysState {
  final List<Forecast> forecast;

  const Forecast5DaysLoaded(this.forecast);
}

class Forecast5DaysError extends Forecast5DaysState {
  final String errorMessage;

  const Forecast5DaysError(this.errorMessage);
}
