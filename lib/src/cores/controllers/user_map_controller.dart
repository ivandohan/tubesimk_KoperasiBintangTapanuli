import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class UserMapController extends GetxController {
  static UserMapController instance = Get.find();

  final Completer<GoogleMapController> controller = Completer();
  static const LatLng sourceLocation = LatLng(37.4220656, -122.08480897);
  static const LatLng destination = LatLng(37.4116103, -122.0713127);
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;


  void getCurrentLocation() async {
    print("i said start");

    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.getLocation().then((value) {
      currentLocation = value;
      print("============== LAT : ${currentLocation!.latitude}");
      print("============== LAT : ${currentLocation!.longitude}");
    });

    GoogleMapController gmController = await controller.future;

    location.onLocationChanged.listen((event) {
      currentLocation = event;

      gmController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 20,
          target: LatLng(
            event.latitude!,
            event.longitude!,
          ),
        ),
      ));
    });
  }
}