import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServiceException implements Exception {
  final String message;

  LocationServiceException(this.message);

  @override
  String toString() => 'LocationServiceException: $message';
}

class LocationHelper {
  static final LocationHelper instance = LocationHelper._();

  factory LocationHelper() {
    return instance;
  }

  LocationHelper._();
  Future<bool> checkPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocationServiceException('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw LocationServiceException(
            'Location permissions are permanently denied.');
      }
      return true;
    } catch (e) {
      print('Error checking location permission: $e');
      return false;
    }
  }

  Future<Position> getLatLong() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<void> updateLocation() async {
    return await getPositionDetails(currentPosition: await getLatLong());
  }

  Future<void> getPositionDetails({required Position? currentPosition}) async {
    try {
      if (currentPosition != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude,
          currentPosition.longitude,
        );

        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          Location().updateLocation(
            city: placemark.locality ?? 'UNKNOWN',
            country: placemark.country ?? 'UNKNOWN',
            position: currentPosition,
          );
        }
      }
    } catch (e) {
      print('Error updating location details: $e');
    }
  }

  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Opens the application settings.
  Future<bool> isAppSettingsOpens() async {
    return await Geolocator.openAppSettings();
  }

  Future<bool> isLocationSettingsOpens() async {
    return await Geolocator.openLocationSettings();
  }

  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }
}

class Location {
  static final Location instance = Location._();
  String _city = '';
  String _country = '';
  Position? _position;

  factory Location() {
    return instance;
  }

  Location._();

  void updateLocation({
    required String city,
    required String country,
    required Position position,
  }) {
    _city = city;
    _country = country;
    _position = position;
  }

  String get city => _city;
  String get country => _country;
  Position? get position => _position;
}
