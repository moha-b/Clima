part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {
  final String lottie = AppLottie.loadingWeather;
  final String text = "Loading...";
}

class HomeSuccessState extends HomeState {
  final Weather weatherData;
  final Sys sys;
  HomeSuccessState({required this.weatherData, required this.sys});
}

class HomeErrorState extends HomeState {
  final String lottie = AppLottie.failure;
  final String error;

  HomeErrorState({required this.error});
}
