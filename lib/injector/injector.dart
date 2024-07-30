import 'package:flutter_app/controllers/calculation_controller.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/controllers/data_subjects.dart';
import 'package:flutter_app/controllers/fuel_selection_service.dart';
import 'package:flutter_app/controllers/location_service.dart';
import 'package:flutter_app/controllers/settings_controller.dart';
import 'package:flutter_app/controllers/settings_service.dart';

void setupGetIt() {
  setupThemeSettings();
  setupServiceLocator();
}

void setupThemeSettings() {
  getIt.registerSingleton<SettingsController>(
      SettingsController(SettingsService()));
}

void setupServiceLocator() {
  // Register CalculationController
  getIt.registerLazySingleton<CalculationController>(
      () => CalculationController());

  // Register DataSubjects
  getIt.registerLazySingleton<DataSubjects>(() => DataSubjects());

  // Register FuelSelectionService
  getIt.registerFactory<FuelSelectionService>(() => FuelSelectionService());

  // Register LocationService
  getIt.registerFactory<LocationService>(() => LocationService(
        getIt<DataSubjects>(),
        getIt<CalculationController>(),
      ));
}
