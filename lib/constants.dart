import 'package:flutter_app/controllers/auth_controller.dart';
import 'package:flutter_app/controllers/calculation_controller.dart';
import 'package:flutter_app/controllers/data_subjects.dart';
import 'package:flutter_app/controllers/fuel_selection_service.dart';
import 'package:flutter_app/controllers/location_service.dart';
import 'package:flutter_app/controllers/navigation_stream_controller.dart';
import 'package:flutter_app/controllers/places_service.dart';
import 'package:flutter_app/controllers/search_location_controller.dart';
import 'package:flutter_app/controllers/settings_controller.dart';
import 'package:get_it/get_it.dart';

// Initialize the GetIt service locator instance
final getIt = GetIt.instance;

// Initialize controllers and services with their respective instances
final navigationController = NavigationStreamController();
final placeService = PlacesServiceController();
final searchLocationController = SearchLocationController();
final authController = AuthController();

// Accessing services and controllers registered with GetIt
final CalculationController calculationController = CalculationController();
final DataSubjects dataSubjects = getIt<DataSubjects>();
final FuelSelectionService fuelSelectionService = getIt<FuelSelectionService>();
final LocationService locationService = getIt<LocationService>();
final SettingsController settingsController = getIt<SettingsController>();

// Constants for Google Places API usage
const placesApiKey = 'AIzaSyBNbCdJwjhTEXyISGL7ri3uTP_CUXWJZnE';
const placeSearchBaseUrl =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json';
const placeDetailsSearchBaseUrl =
    'https://maps.googleapis.com/maps/api/place/details/json';

// Type alias for a map of string keys to dynamic values
typedef DataMap = Map<String, dynamic>;

// Enumeration for navigation events in the application
enum NavigationEvent {
  calculation,             // Event for navigating to calculation screen
  calculation1,           // Event for navigating to first calculation screen
  calculation2,           // Event for navigating to second calculation screen
  carModelsListing,       // Event for navigating to car models listing
  carsListing,            // Event for navigating to cars listing
  carCalculationsResult,  // Event for navigating to car calculations results
  home,                   // Event for navigating to home screen
  login,                  // Event for navigating to login screen
  results,                // Event for navigating to results screen
  signUp,                 // Event for navigating to sign-up screen
  profile,                // Event for navigating to profile screen
  splash,                 // Event for navigating to splash screen
  destPage,               // Event for navigating to destination page
  originPage,             // Event for navigating to origin page
}
