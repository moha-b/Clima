part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class ThemeChangedState extends AppState {
  final ThemeMode theme;

  const ThemeChangedState(this.theme);

  @override
  List<Object> get props => [theme];
}

class AskForLocationPermissionState extends AppState {
  final String lottie = AppImages.fetchLocation;
  final String text = "Looking for your location";
}

class FetchCurrentLocationState extends AppState {
  double? latitude;
  double? longitude;

  FetchCurrentLocationState({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [];
}

class LocationPermissionDeniedState extends AppState {
  final String lottie = AppImages.locationNotFound;
  final String text =
      "The app requires access to your location in order to provide accurate weather information.\n Please enable location services to enjoy the app's full functionality.";
}
