import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final user = FirebaseAuth.instance.currentUser;

void registerPlatformInstance() {
  if (Platform.isAndroid) {
    GeolocatorAndroid.registerWith();
  } else if (Platform.isIOS) {
    GeolocatorApple.registerWith();
  }
}

void storeUsersAddress(address) async {
  print(user!.uid);
  FirebaseFirestore.instance
      .collection('Customer')
      .doc(user!.uid)
      .update({"address": List.from(address)});
}

Future<void> getCurrentLocation(context) async {
  await handleLocationPermission(context);
  await getCurrentPosition(context);
}

Future<dynamic> getCurrentPosition(context) async {
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
      storeUsersAddress({
        position.latitude.toString(),
        position.longitude.toString(),
        place.street.toString(),
        place.subLocality.toString(),
        place.subAdministrativeArea.toString(),
        place.postalCode.toString(),
        place.country.toString(),
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
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
