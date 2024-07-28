import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:provider/provider.dart';
import '../providers/map_provider.dart';

class MapScreen extends StatelessWidget {
  final String _mapStyle =
      'https://api.olamaps.io/tiles/vector/v1/styles/default-light-standard/style.json?api_key=mYUer5kfYh1mxVxM6dJ73L7lQbFjEIMCHds9vANS';

  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapProvider>(context);

    return mapProvider.currentLocation == null
        ? const Center(child: CircularProgressIndicator())
        : MapLibreMap(
            styleString: _mapStyle,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                mapProvider.currentLocation!.latitude,
                mapProvider.currentLocation!.longitude,
              ),
              zoom: 14.0,
            ),
            onMapCreated: (controller) {
              mapProvider.fetchDrivers().then((_) {
                for (var driver in mapProvider.drivers) {
                  controller.addSymbol(
                    SymbolOptions(
                      geometry: LatLng(
                          driver.location.latitude, driver.location.longitude),
                      iconImage: 'assets/images/car.png',
                      iconSize: 0.5,
                      textField: driver.name,
                      textOffset: const Offset(0, 1.5),
                    ),
                  );
                }
              });
            },
          );
  }
}
