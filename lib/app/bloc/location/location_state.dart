part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class AskForLocationPermissionState extends LocationState {
  final String lottie = AppImages.fetchLocation;
  final String text = "Looking for your location";
}

class FetchCurrentLocationState extends LocationState {
  double? latitude;
  double? longitude;

  FetchCurrentLocationState({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [];
}

class LocationPermissionDeniedState extends LocationState {
  final String lottie = AppImages.locationNotFound;
  final String text =
      "The app requires access to your location in order to provide accurate weather information.\n Please enable location services to enjoy the app's full functionality.";
}
