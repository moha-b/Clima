import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(AskForLocationPermissionState()) {
    //
    on<GetLocationEvent>((event, emit) async {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      var status = await Permission.location.request();
      if (serviceEnabled) {
        emit(AskForLocationPermissionState());
        if (status.isGranted) {
          Position position = await Geolocator.getCurrentPosition();
          emit(FetchCurrentLocationState(
            latitude: position.latitude,
            longitude: position.longitude,
          ));
        } else if (status.isDenied || status.isPermanentlyDenied) {
          // Permission permanently denied. Direct the user to the app settings.
          emit(LocationPermissionDeniedState());
        }
      } else {
        print("Location Service Disable");
      }
    });
    //
    on<RetryPermissionEvent>((event, emit) async {
      emit(AskForLocationPermissionState());
      var status = await Permission.location.request();
      await openAppSettings();

      await Future.delayed(const Duration(seconds: 3));
      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        emit(FetchCurrentLocationState(
          latitude: position.latitude,
          longitude: position.longitude,
        ));
      } else {
        emit(LocationPermissionDeniedState());
      }
    });
  }
}
