part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {
  final String lottie = AppLottie.loadingWeather;
  final String text = "Loading...";
}

class HomeSuccessState extends HomeState {
  final WeatherData weather;
  HomeSuccessState({required this.weather});
}

class HomeErrorState extends HomeState {
  final String lottie = AppLottie.failure;
  final String error;

  HomeErrorState({required this.error});
}
