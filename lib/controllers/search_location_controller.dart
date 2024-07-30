import 'dart:convert';

import 'package:flutter_app/constants.dart';
import 'package:http/src/response.dart';
import 'package:rxdart/rxdart.dart';

class SearchLocationController {
  //searchTerm
  // final _inputSubject = BehaviorSubject<String>.seeded("");
  // Stream<String> get input => _inputSubject.stream;
  //location results
  final _locationResultsSubject = BehaviorSubject<List<DataMap>>.seeded([]);

  Stream<List<DataMap>> get locations => _locationResultsSubject.stream;

  // updateSearchTerm(String value) => _inputSubject.sink.add(value);
  addLocationsOneByOne(DataMap location) {}

  clearSearchLocations() => _locationResultsSubject.sink.add([]);

  Future getAutocompleteSuggestions(String input) async {
    // Create a PlacesService instance using the client
    // var searchTerm = "kasarani $input";

    final autocompleteSuggestions =
        await placeService.getAutocompleteSuggestions(input: input);

    if (autocompleteSuggestions.statusCode == 200) {
      // final data = autocompleteSuggestions.body.toString();
      // print(data);
      List<dynamic> placeIds =
          jsonDecode((autocompleteSuggestions.body.toString()))['predictions']
              .map((json) => json['place_id'] as String)
              .toList();

      _locationResultsSubject.sink
          .add(await _getPlaceDetails(places: placeIds));
    } else {
      _locationResultsSubject.sink.add([]);
    }
  }

  Future<List<DataMap>> _getPlaceDetails(
      {required List<dynamic> places}) async {
    List<DataMap> _fetchedPlaces = [];
    for (String placeId in places) {
      final placeDetailsResponse = await _getSinglePlaceDetail(placeId);

      if (placeDetailsResponse.statusCode == 200) {
        final result =
            jsonDecode(placeDetailsResponse.body.toString())['result'];
        var _location =
            _convertjsonPlaceToLocationDataMap(placeId: placeId, json: result);
        _fetchedPlaces.add(_location);
      } else {
        return _fetchedPlaces;
      }
    }
    return _fetchedPlaces;
  }

  Future<Response> _getSinglePlaceDetail(String placeId) async =>
      await placeService.getPlaceDetails(placeId: placeId);

  DataMap _convertjsonPlaceToLocationDataMap(
      {required dynamic json, required String placeId}) {
    final geometry = json['geometry']['location'];
    final formattedAddress = json['formatted_address'];
    final name = json['name'];
    final lat = geometry['lat'];
    final lng = geometry['lng'];
    DataMap location = {
      "id": placeId,
      "formattedAddress": formattedAddress,
      "name": name,
      "lat": lat,
      "long": lng,
      "created": DateTime.now(),
      "updated": DateTime.now(),
    };
    return location;
  }
}
