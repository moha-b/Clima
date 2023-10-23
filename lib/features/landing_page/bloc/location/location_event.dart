part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
  List<Object> get props => [];
}

class GetLocationEvent extends LocationEvent {}

class RetryPermissionEvent extends LocationEvent {}
