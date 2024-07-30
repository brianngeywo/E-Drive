import 'package:flutter_app/constants.dart';
import 'package:rxdart/rxdart.dart';

class DataSubjects {
  final _selectedParentCarSubject = BehaviorSubject<DataMap>();
  final _selectedFuelSubject = BehaviorSubject<DataMap>();
  final _selectedParentCarModelSubject = BehaviorSubject<DataMap>();
  final _originLocationSubject = BehaviorSubject<DataMap>();
  final _destinationLocationSubject = BehaviorSubject<DataMap>();
  final _distanceSubject = BehaviorSubject<double>();

  Stream<DataMap> get selectedFuelTypeStream => _selectedFuelSubject.stream;
  Stream<DataMap> get parentCarStream => _selectedParentCarSubject.stream;
  Stream<DataMap> get parentCarModelStream => _selectedParentCarModelSubject.stream;
  Stream<DataMap> get originLocationStream => _originLocationSubject.stream;
  Stream<DataMap> get destinationLocationStream => _destinationLocationSubject.stream;
  Stream<double> get distanceStream => _distanceSubject.stream;

  BehaviorSubject<DataMap> get selectedFuelSubject => _selectedFuelSubject;
  BehaviorSubject<DataMap> get selectedParentCarSubject => _selectedParentCarSubject;
  BehaviorSubject<DataMap> get selectedParentCarModelSubject => _selectedParentCarModelSubject;
  BehaviorSubject<DataMap> get originLocationSubject => _originLocationSubject;
  BehaviorSubject<DataMap> get destinationLocationSubject => _destinationLocationSubject;
  BehaviorSubject<double> get distanceSubject => _distanceSubject;

  void dispose() {
    _selectedParentCarSubject.close();
    _selectedFuelSubject.close();
    _selectedParentCarModelSubject.close();
    _originLocationSubject.close();
    _destinationLocationSubject.close();
    _distanceSubject.close();
  }
}
