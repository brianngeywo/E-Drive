import 'package:flutter_app/constants.dart';

class FuelSelectionService {
  void selectFuel(DataMap fuel) {
    dataSubjects.selectedFuelSubject.value = fuel;
    double price = fuel['price'];
    print('Selected Fuel Price: $price');
    calculationController.fuelPrice.value = price;
  }

  void selectParentCar(DataMap parentCar) {
    dataSubjects.selectedParentCarSubject.sink.add(parentCar);
  }

  void selectCarModel(DataMap carModel) {
    dataSubjects.selectedParentCarModelSubject.value = carModel;
    double efficiency = carModel['fuel_efficiency'];
    print('Selected Car Model Fuel Efficiency: $efficiency');
    calculationController.fuelEfficiency.value = efficiency;
  }

  void saveDistantInKm(double distance) {
    dataSubjects.distanceSubject.value = distance;
    double distanceInKm = distance / 1000.0;
    print('distance: $distanceInKm');

    calculationController.distance.value = distanceInKm;
  }
}
