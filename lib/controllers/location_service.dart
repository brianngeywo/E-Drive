import 'dart:convert';
import 'package:flutter_app/controllers/calculation_controller.dart';
import 'package:flutter_app/controllers/data_subjects.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/constants.dart';

class LocationService {
  final DataSubjects dataSubjects;
  final CalculationController calculationController;

  LocationService(this.dataSubjects, this.calculationController);

  void saveOriginLocation(DataMap location) {
    dataSubjects.originLocationSubject.sink.add(location);
    _calculateDistance();
  }

  void saveDestinationLocation(DataMap location) {
    dataSubjects.destinationLocationSubject.sink.add(location);
    _calculateDistance();
  }

  Future<void> _calculateDistance() async {
    if (dataSubjects.originLocationSubject.hasValue &&
        dataSubjects.destinationLocationSubject.hasValue) {
      final origin = dataSubjects.originLocationSubject.value;
      final destination = dataSubjects.destinationLocationSubject.value;

      final String originAddress = '${origin['formattedAddress']}';
      final String destinationAddress = '${destination['formattedAddress']}';

      final url = Uri.parse(
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationAddress&origins=$originAddress&key=$placesApiKey');

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          int distanceInMeters =
              data['rows'][0]['elements'][0]['distance']['value'];
          fuelSelectionService.saveDistantInKm(distanceInMeters.toDouble());
        } else {
          print('Failed to fetch distance: ${response.reasonPhrase}');
        }
      } catch (error) {
        print('Error fetching distance: $error');
      }
    }
  }
}
