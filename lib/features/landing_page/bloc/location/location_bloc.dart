import 'package:clima/core/helper/location_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(AskForLocationPermissionState()) {
    on<GetLocationEvent>(_getLocation);
    // TODO: request permission again

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

  _enableLocationService(
      EnableLocationServiceEvent event, Emitter<LocationState> emit) async {
    bool isSettingsOpened =
        await LocationHelper.instance.openLocationSettings();
    if (isSettingsOpened) {
      _getLocation(GetLocationEvent(), emit);
    } else {
      emit(LocationServiceDisabledState());
    }
  }
}
