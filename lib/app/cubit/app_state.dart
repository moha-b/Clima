part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppStarted extends AppState {
  // String? error;
  // final bool isNight;
  // double? latitude;
  // double? longitude;
  WeatherModel weatherModel;

  AppStarted(this.weatherModel);

// AppStarted(
  //     {required this.isNight, this.error, this.latitude, this.longitude});
}

class AppInitial extends AppState {
  final String lottie = AppImages.location;
  final String text = "Looking for your location";
}

class AppFailure extends AppState {
  final String error;
  final String lottie = AppImages.failure;

  AppFailure({required this.error});
}

//
// class AppSuccess extends AppState {
//   final bool isNight;
//
//   AppSuccess(this.isNight);
// }
//
// class AppFailure extends AppState {
//   final String error;
//   final String lottie = AppImages.failure;
//
//   AppFailure({required this.error});
// }
