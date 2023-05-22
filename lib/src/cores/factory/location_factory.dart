import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tubesimk_koperasibintangtapanuli/src/services/location_map_serive.dart';

class LocationFactory extends GetxController {

  List<Prediction> _predictionList = [];

  Future<List<Prediction>> searchLocation(BuildContext context, String text) async {
    if(text != null && text.isNotEmpty) {
      http.Response response = await LocationService.getLocationData(text);
      var data = jsonDecode(response.body.toString());
      print("my status is ${data['status']}");
      if ( data['status']== 'OK') {
        _predictionList = [];
        data['predictions'].forEach((prediction)
        => _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }
}