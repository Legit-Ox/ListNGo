import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';

void registerPlatformInstance() {
  if (Platform.isAndroid) {
    GeolocatorAndroid.registerWith();
  } else if (Platform.isIOS) {
    GeolocatorApple.registerWith();
  }
}

Future<String> getCurrentLocation(context) async {
  await handleLocationPermission(context);
  return await getCurrentPosition(context);
}

const Position defaultPosition = Position(
    longitude: 0,
    latitude: 0,
    timestamp: null,
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0);

Future<String> getCurrentPosition(context) async {
  final hasPermission = await handleLocationPermission(context);

  if (!hasPermission) {
    print("Location permission not granted");
    return "";
  } else {
    late Position position;
    print("Location permission granted");
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position1) {
      position = position1;
    }).catchError((e) {
      debugPrint(e);
    });

    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      print(place);
      String currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      return currentAddress;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  return "No location found";
}

Future<bool> handleLocationPermission(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}
