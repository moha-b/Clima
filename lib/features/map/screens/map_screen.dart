import 'dart:async';

import 'package:clima/core/helper/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set<Marker>();
  static final LatLng _center = LatLng(Location.instance.position!.latitude,
      Location.instance.position!.longitude);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
            markerId: const MarkerId('you are here'),
            position: point,
            infoWindow: const InfoWindow(title: "you are here")),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    _setMarker(_center);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 17.0,
          ),
        ),
      ],
    );
  }
}
