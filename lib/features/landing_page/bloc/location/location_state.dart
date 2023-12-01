part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  List<Object> get props => [];
}

class AskForLocationPermissionState extends LocationState {}

class FetchCurrentLocationState extends LocationState {
  double? latitude;
  double? longitude;

  FetchCurrentLocationState({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [];
}

class LocationPermissionDeniedState extends LocationState {}

class LocationServiceDisabledState extends LocationState {}
