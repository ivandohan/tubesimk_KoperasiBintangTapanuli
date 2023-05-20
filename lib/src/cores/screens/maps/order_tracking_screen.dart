import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/maps/map_screen.dart';
import 'package:location/location.dart' as loc;

class TrackingMenu extends StatefulWidget {
  const TrackingMenu({Key? key}) : super(key: key);

  @override
  State<TrackingMenu> createState() => _TrackingMenuState();
}

class _TrackingMenuState extends State<TrackingMenu> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextButton(onPressed: (){_getLocation();}, child: const Text("Add")),
            TextButton(onPressed: (){_listeningtoLocation();}, child: const Text("Enable")),
            TextButton(onPressed: (){_stopListening();}, child: const Text("Stop")),

            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("location").snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(snapshot.data!.docs[index]['name'].toString()),
                        subtitle: Row(
                          children: [
                            Text(snapshot.data!.docs[index]['latitude'].toString()),
                            const SizedBox(width: 20,),
                            Text(snapshot.data!.docs[index]['longitude'].toString()),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () => Get.to(() => MapScreen(
                            userId: snapshot.data!.docs[index].id.toString(),
                          )),
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getLocation() async {
    try{
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance
      .collection('location')
      .doc('user1')
      .set({
        'latitude': _locationResult.latitude, 'longitude': _locationResult.longitude, 'name': 'doh4n',
      }, SetOptions(merge: true));
    }catch(e) {
      print(e);
    }
  }

  Future<void> _listeningtoLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((e) {
      print(e);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((currentLocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set(
        {
          'latitude': currentLocation.latitude,
          'longitude': currentLocation.longitude,
          'name': 'doh4n'
        },
        SetOptions(merge: true),
      );
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if(status.isGranted) {
      print("============================= LOCATION GRANTED");
    } else if(status.isDenied) {
      _requestPermission();
    } else if(status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
