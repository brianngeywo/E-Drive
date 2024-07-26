import 'package:get/get.dart';

class CalculationController extends GetxController {
  // Rx variables
  Rx<double> distance = Rx<double>(0.0);
  Rx<double> fuelEfficiency = Rx<double>(0.0);
  Rx<double> fuelPrice = Rx<double>(0.0);
  Rx<double> totalCost = Rx<double>(0.0);

  // Method to calculate total cost
  double calculateTotalCost() {
    double fuelNeeded = distance.value / fuelEfficiency.value;
    double totalCost = fuelNeeded * fuelPrice.value;
    return totalCost;
  }


}
