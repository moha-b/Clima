import 'package:clima/core/helper/location_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(AskForLocationPermissionState()) {
    var locationHelper = LocationHelper.instance;
    bool locationService, locationPermission;
    //
    on<GetLocationEvent>((event, emit) async {
      locationService = await locationHelper.isLocationServiceEnabled();
      if (locationService) {
        locationPermission = await locationHelper.checkPermission();
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
        // open app settings
      }
    });
    // TODO: request permission again
  }
}
