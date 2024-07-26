import 'package:e_driver_theme_mode_settings/settings/settings_controller.dart';
import 'package:flutter_app/calculation_controller.dart';
import 'package:flutter_app/fuel_cost_calculation_controller.dart';
import 'package:flutter_app/navigation_stream_controller.dart';
import 'package:flutter_app/places_service.dart';
import 'package:flutter_app/search_location_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final settingsController = getIt.call<SettingsController>;
final navigationController = NavigationStreamController();
final fuelCostCalculationController = FuelCostCalculationController();
final placeService = PlacesServiceController();
final searchLocationController = SearchLocationController();
final calculationController = CalculationController();
const placesApiKey = 'AIzaSyBNbCdJwjhTEXyISGL7ri3uTP_CUXWJZnE';
const placeSearchBaseUrl =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json';
const placeDetailsSearchBaseUrl =
    'https://maps.googleapis.com/maps/api/place/details/json';
typedef DataMap = Map<String, dynamic>;

enum NavigationEvent {
  calculation,
  calculation1,
  calculation2,
  carModelsListing,
  carsListing,
  carCalculationsResult,
  home,
  login,
  results,
  signUp,
  profile,
  splash,
  destPage,
  originPage,
}
