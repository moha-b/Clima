part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {
  final String lottie = AppLottie.loadingWeather;
  final String text = "Loading...";
}

class HomeSuccessState extends HomeState {
  final WeatherModel weatherData;
  final String todayDate;
  final String temperature;
  final String weatherImage;
  final Color textColor;
  HomeSuccessState(
      {required this.weatherData,
      required this.todayDate,
      required this.temperature,
      required this.weatherImage,
      required this.textColor});
}

class HomeErrorState extends HomeState {
  final String lottie = AppLottie.failure;
  final String error;

  HomeErrorState({required this.error});
}
