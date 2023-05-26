import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/location_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/orders/order_form_screen.dart';

class DashboardSearchWidget extends StatelessWidget {
  DashboardSearchWidget({
    super.key,
  });

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme txtTheme = Theme.of(context).textTheme;
    return Container(
      height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _controller,
            textInputAction: TextInputAction.search,
            autofocus: false,
            keyboardType: TextInputType.streetAddress,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search_sharp, color: Colors.black),
              hintText: "Cari lokasi",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await Get.find<LocationFactory>()
                .searchLocation(context, pattern);
          },
          itemBuilder: (_, Prediction suggestion) {
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
            print("LOCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC : ${suggestion.description!}");
            Get.to(() => OrderFormScreen(), arguments: {'service': "", 'location': suggestion.description});
          },
        ),
    );
  }
}