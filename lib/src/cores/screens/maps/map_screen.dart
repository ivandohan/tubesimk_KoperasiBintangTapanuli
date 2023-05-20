import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.userId});

  final String userId;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('location').snapshots(),
          builder: (context, snapshot) {

            if(_added) updateMapCamera(snapshot);
            if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(),);

            return GoogleMap(
              mapType: MapType.normal,
              markers: {
                Marker(
                  markerId: MarkerId('user'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
                  position: LatLng(
                      snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitude'],
                      snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitude']
                  ),
                ),
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitude'],
                  snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitude']
                ),
                zoom: 14.47,
              ),
              onMapCreated: (controller) async {
                setState(() {
                  _controller = controller;
                  _added = true;
                });
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> updateMapCamera(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
          snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitude'],
          snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitude']
      ),
      zoom: 14.47,
    )));
  }
}