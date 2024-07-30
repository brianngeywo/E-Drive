import 'package:get/get.dart';

class CalculationController extends GetxController {
  // Rx variables
  Rx<double> distance = Rx<double>(0.0);
  Rx<double> fuelEfficiency = Rx<double>(0.0);
  Rx<double> fuelPrice = Rx<double>(0.0);
  Rx<double> totalCost = Rx<double>(0.0);
  Rx<double> fuelNeeded = Rx<double>(0.0);

  @override
  void onInit() {
    super.onInit();
    // Listen for changes and update fuelNeeded and totalCost accordingly
    ever(distance, (_) => updateCalculations());
    ever(fuelEfficiency, (_) => updateCalculations());
    ever(fuelPrice, (_) => updateCalculations());
  }

  // Method to update calculations
void updateCalculations() {
  // Print the current values for debugging purposes
  print('Distance: ${distance.value} km');
  print('Fuel Efficiency: ${fuelEfficiency.value} km/l');
  print('Fuel Price: ${fuelPrice.value} per liter');
  print('Fuel Needed: ${fuelNeeded.value} liters');
  print('Total Cost: ${totalCost.value}');

  // Calculate the amount of fuel needed
  double fuelNeededValue = distance.value / fuelEfficiency.value;

  // Calculate the total cost based on the fuel needed and the price per liter
  double totalCostValue = fuelNeededValue * fuelPrice.value;

  // Update the reactive variables with the calculated values
  fuelNeeded.value = fuelNeededValue;
  totalCost.value = totalCostValue;

  // Print the updated values for debugging purposes
  print('Updated Fuel Needed: ${fuelNeeded.value} liters');
  print('Updated Total Cost: ${totalCost.value}');
}

}
