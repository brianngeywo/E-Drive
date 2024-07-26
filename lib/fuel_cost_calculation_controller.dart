import 'dart:convert';

import 'package:flutter_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

// Assuming you have a controller instance available here

class FuelCostCalculationController {
  final _selectedParentCarSubject = BehaviorSubject<DataMap>();
  final _selectedFuelSubject = BehaviorSubject<DataMap>();
  final _selectedParentCarModelSubject = BehaviorSubject<DataMap>();
  final _originLocationSubject = BehaviorSubject<DataMap>();
  final _destinationLocationSubject = BehaviorSubject<DataMap>();
  final _distanceSubject = BehaviorSubject<double>();

  // Exposing the streams
  Stream<DataMap> get selectedFuelTypeStream => _selectedFuelSubject.stream;
  Stream<DataMap> get parentCarStream => _selectedParentCarSubject.stream;
  Stream<DataMap> get parentCarModelStream =>
      _selectedParentCarModelSubject.stream;
  Stream<DataMap> get originLocationStream => _originLocationSubject.stream;
  Stream<DataMap> get destinationLocationStream =>
      _destinationLocationSubject.stream;
  Stream<double> get distanceStream => _distanceSubject.stream;

  // Method to select fuel type
  void selectFuel(DataMap fuel) {
    _selectedFuelSubject.value = fuel;
    calculationController.fuelPrice.value = fuel['price'];
  }

  // Method to select parent car
  void selectParentCar(DataMap parentCar) {
    _selectedParentCarSubject.sink.add(parentCar);
  }

  // Method to select car model
  void selectCarModel(DataMap carModel) {
    _selectedParentCarModelSubject.value = carModel;
    calculationController.fuelEfficiency.value = carModel['fuel_efficiency'];
  }

  void saveOriginLocation(DataMap location) {
    print("origin: $location");
    _originLocationSubject.sink.add(location);
    _calculateDistance();
  }

  void saveDestinationLocation(DataMap location) {
    print("destination: $location");
    _destinationLocationSubject.sink.add(location);
    _calculateDistance();
  }

  Future<void> _calculateDistance() async {
    if (_originLocationSubject.hasValue &&
        _destinationLocationSubject.hasValue) {
      final origin = _originLocationSubject.value;
      final destination = _destinationLocationSubject.value;

      final String originAddress = '${origin['formattedAddress']}';
      final String destinationAddress = '${destination['formattedAddress']}';
      print(originAddress);
      print(destinationAddress);

      final url = Uri.parse(
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationAddress&origins=$originAddress&key=$placesApiKey');

      try {
        final response = await http.get(url);
        print(response.body);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final distanceInMeters =
              data['rows'][0]['elements'][0]['distance']['value'];
          final distanceInKm = distanceInMeters / 1000.0;
          print(distanceInKm);
          calculationController.distance.value = distanceInKm;
          _distanceSubject.sink.add(distanceInKm);
        } else {
          print('Failed to fetch distance: ${response.reasonPhrase}');
        }
      } catch (error) {
        print('Error fetching distance: $error');
      }
    }
  }

  void dispose() {
    _originLocationSubject.close();
    _destinationLocationSubject.close();
    _distanceSubject.close();
    _selectedParentCarSubject.close();
    _selectedFuelSubject.close();
    _selectedParentCarModelSubject.close();
  }
}
