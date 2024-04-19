import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/geo_position.dart';

class LocationService {
  Future<LocationData?> getPosition() async {
    try {
      Location location = Location();
      return location.getLocation();
    } on PlatformException catch (error) {
      debugPrint("Unable to get location : ${error.message}");
      return null;
    }
  }
}
