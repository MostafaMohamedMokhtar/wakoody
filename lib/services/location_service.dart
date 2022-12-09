import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';

final locationProvider = ChangeNotifierProvider<LocationService>((ref) {
  return LocationService();
});

class LocationService extends ChangeNotifier{

  String? currentAddress;
  Position? currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool? serviceEnabled;
    LocationPermission? permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: AppStrings.locationServiceDisabled.tr() , toastLength: Toast.LENGTH_LONG);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: AppStrings.locationPermissionDenied.tr() , toastLength: Toast.LENGTH_LONG);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: AppStrings.locationPermissionPermanentlyDenied.tr() , toastLength: Toast.LENGTH_LONG);
      return false;
    }
    return true;
  } // end _handleLocationPermission()

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
       currentPosition = position ;
       print('mokh location : $currentPosition');
      _getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
    notifyListeners();
  } // end _getCurrentPosition()

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placeMarks) {
      Placemark place = placeMarks[0];
      currentAddress =
      ' ${place.name}, ${place.subAdministrativeArea}, ${place.postalCode}';
    }).catchError((e) {
      debugPrint(e);
    });
  } // _getAddressFromLatLng()
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
} // end class
