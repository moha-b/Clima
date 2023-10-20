import 'package:geolocator/geolocator.dart';

class LocationServiceException implements Exception {
  final String message;
  LocationServiceException(this.message);

  @override
  String toString() => 'LocationServiceException: $message';
}

class LocationHelper {
  static double? _latitude;
  static double? _longitude;

  static double? get latitude => _latitude;
  static double? get longitude => _longitude;

  /// Determines the current position of the device.
  ///
  /// Throws a [LocationServiceException] if location services are disabled,
  /// permissions are denied, or if any other error occurs during the process.
  static Future<Position?> determinePosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw LocationServiceException('Location services are disabled.');
      }

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
      Position position = await Geolocator.getCurrentPosition();
      _latitude = position.latitude;
      _longitude = position.longitude;
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      throw LocationServiceException('Error: $e');
    }
  }

  /// Starts listening for location updates.
  ///
  /// Calls [onLocationUpdate] callback with the updated location and
  /// [onError] callback if any error occurs during the process.
  void startListeningForLocationUpdates(
      void Function(Position) onLocationUpdate,
      void Function(Exception) onError) {
    Geolocator.getPositionStream().listen(
      (Position position) {
        onLocationUpdate(position);
      },
      onError: (error) {
        onError(LocationServiceException(
            'Error occurred while fetching location: $error'));
      },
    );
  }
}
