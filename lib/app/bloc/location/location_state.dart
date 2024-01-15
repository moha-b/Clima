part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object> get props => [];
}

class AskForLocationPermissionState extends LocationState {}

class FetchCurrentLocationState extends LocationState {}

class LocationPermissionDeniedState extends LocationState {}

class LocationServiceDisabledState extends LocationState {}
