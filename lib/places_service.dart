import 'package:flutter_app/constants.dart';
import 'package:http/http.dart' as http;

class PlacesServiceController {
  Future<http.Response> getAutocompleteSuggestions(
      {required String input}) async {
    final request =
        "$placeSearchBaseUrl?input=$input&types=geocode&key=$placesApiKey";
    final response = await http.get(Uri.parse(request));
    // if (response.statusCode == 200) {
    // var _places = await jsonDecode(response.body.toString())['predictions'];
    // print(_places);
    return response;
    // } else {
    //   return null;
    // }
  }

  Future<http.Response> getPlaceDetails(
      {required String placeId}) async {
    final request =
        "$placeDetailsSearchBaseUrl?place_id=$placeId&key=$placesApiKey";
         final response = await http.get(Uri.parse(request));
    // if (response.statusCode == 200) {
    // var _places = await jsonDecode(response.body.toString())['predictions'];
    return response;
  }
}

class AutocompleteSuggestion {
  final String placeId;
  final String description;

  AutocompleteSuggestion({required this.placeId, required this.description});

  factory AutocompleteSuggestion.fromJson(Map<String, dynamic> json) {
    return AutocompleteSuggestion(
      placeId: json['place_id'],
      description: json['description'],
    );
  }
}

class LatLongLocation {
  final double latitude;
  final double longitude;

  LatLongLocation({required this.latitude, required this.longitude});

  String toQueryString() => 'LatLng($latitude,$longitude)';

  factory LatLongLocation.fromQueryString(String queryString) {
    final values =
        queryString.replaceAll('LatLng(', '').replaceAll(')', '').split(',');
    return LatLongLocation(
      latitude: double.parse(values[0]),
      longitude: double.parse(values[1]),
    );
  }
}

// class Place {
//   final String placeId;
//   final String name;
//   final String formattedAddress;
//   final double rating;
//   final LatLongLocation location;

//   Place({
//     required this.placeId,
//     required this.name,
//     required this.formattedAddress,
//     required this.rating,
//     required this.location,
//   });

//   factory Place.fromJson(Map<String, dynamic> json) {
//     final geometry = json['geometry']['location'];
//     final location = LatLongLocation.fromQueryString(
//         'LatLng(${geometry['lat']},${geometry['lng']})');

//     return Place(
//       placeId: json['place_id'],
//       name: json['name'],
//       formattedAddress: json['formatted_address'],
//       rating: json['rating']?.toDouble() ?? 0.0,
//       location: location,
//     );
//   }
// }
