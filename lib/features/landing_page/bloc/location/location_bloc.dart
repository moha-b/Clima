import 'package:clima/core/helper/location_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(AskForLocationPermissionState()) {
    //  get current location
    on<GetLocationEvent>(_getLocation);
    // re-request permission
    on<RetryPermissionEvent>(_reRequestPermission);
    // enable location service
    on<EnableLocationServiceEvent>(_enableLocationService);
  }
  _getLocation(GetLocationEvent event, Emitter<LocationState> emit) async {
    var locationHelper = LocationHelper.instance;
    bool locationService = await locationHelper.isLocationServiceEnabled();
    if (locationService) {
      bool locationPermission = await locationHelper.checkPermission();
      if (locationPermission) {
        var position = await locationHelper.getLatLong();
        locationHelper.getPositionDetails(currentPosition: position);
        emit(FetchCurrentLocationState(
          latitude: position.latitude,
          longitude: position.longitude,
        ));
      } else {
        emit(LocationPermissionDeniedState());
      }
    } else {
      emit(LocationServiceDisabledState());
    }
  }

  _reRequestPermission(
      RetryPermissionEvent event, Emitter<LocationState> emit) async {
    LocationHelper.instance.openAppSettings();
    bool isAppSettingsOpened =
        await LocationHelper.instance.isAppSettingsOpens();
    if (isAppSettingsOpened) {
      await _getLocation(GetLocationEvent(), emit);
    } else {
      emit(LocationPermissionDeniedState());
    }
  }

  _enableLocationService(
      EnableLocationServiceEvent event, Emitter<LocationState> emit) async {
    LocationHelper.instance.openLocationSettings();
    bool isSettingsOpened =
        await LocationHelper.instance.isLocationSettingsOpens();
    if (isSettingsOpened) {
      await _getLocation(GetLocationEvent(), emit);
    } else {
      emit(LocationServiceDisabledState());
    }
  }
}
