import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/location_factory.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/maps/order_tracking_screen.dart';

class LocationSearchDialog extends StatelessWidget {
  final bool isDirected;
  const LocationSearchDialog({super.key, required this.isDirected});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: 113),
      padding: EdgeInsets.all(20),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(),
        child: SizedBox(
            width: double.infinity,
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _controller,
                textInputAction: TextInputAction.search,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: tDashboardSearch,
                  hintStyle: Theme.of(context).textTheme.headline2?.apply(color: Colors.grey.withOpacity(0.5)),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  suffixIcon: Icon(Icons.search_sharp, color: Colors.black,),
                ),
                style: TextStyle(fontSize: 20),
              ),
              suggestionsCallback: (pattern) async {
                return await Get.find<LocationFactory>()
                    .searchLocation(context, pattern);
              },
              itemBuilder: (context, Prediction suggestion) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    Icon(Icons.location_on),
                    Expanded(
                      child: Text(
                        suggestion.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ]),
                );
              },
              onSuggestionSelected: (Prediction suggestion) {
                print("My location is " + suggestion.description!);
                if(this.isDirected) {
                  Get.to(TrackingMenu());
                } else {
                  Get.back(result: suggestion.description!);
                }
              },
            )),
      ),
    );
  }
}
