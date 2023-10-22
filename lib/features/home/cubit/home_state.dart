part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {
  final String lottie = AppImages.fetchLocation;
  final String text = "Looking for your location";
}

class HomeSuccessState extends HomeState {
  final WeatherModel weatherData;
  final String todayDate;
  final String temperature;
  final String weatherImage;
  HomeSuccessState({
    required this.weatherData,
    required this.todayDate,
    required this.temperature,
    required this.weatherImage,
  });
}

class HomeErrorState extends HomeState {
  final String lottie = AppImages.failure;
  final String error;

  HomeErrorState({required this.error});
}
