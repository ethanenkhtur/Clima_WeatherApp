import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  var latitude = 40.0;
  var longitude = 100.0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
