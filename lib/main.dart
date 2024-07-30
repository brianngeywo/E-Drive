import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/controllers/settings_service.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/injector/injector.dart';

import 'package:flutter_app/pages/calculation.dart';
import 'package:flutter_app/pages/calculation_1.dart';
import 'package:flutter_app/pages/calculation_2.dart';
import 'package:flutter_app/pages/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_app/pages/home_screen.dart';
import 'package:flutter_app/pages/cars_listing.dart';
import 'package:flutter_app/pages/car_models_listing.dart';
import 'package:flutter_app/pages/login_screen.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/pages/car_cost_results.dart';
import 'package:flutter_app/pages/select_destination_location.dart';
import 'package:flutter_app/pages/select_origin_location.dart';
import 'package:flutter_app/pages/sign_up_screen.dart';
import 'package:flutter_app/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  calculationController.onInit();
  settingsController.loadSettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: settingsController,
        builder: (context, snapshot) {
          return MaterialApp(
            // debugShowCheckedModeBanner: false,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: settingsController.themeMode,
            title: 'E-Drive',
            home: Scaffold(
              // body: Calculation(),
              // body: Calculation1(),
              // body: Calculation2(),

              body: StreamBuilder<NavigationEvent>(
                stream: navigationController.navigationStream,
                initialData: NavigationEvent.splash,
                builder: (context, snapshot) {
                  switch (snapshot.data) {
                    case NavigationEvent.home:
                      return HomeScreen();
                    case NavigationEvent.login:
                      return LoginScreen();
                    case NavigationEvent.signUp:
                      return SignUpScreen();
                    case NavigationEvent.profile:
                      return Profile();
                    case NavigationEvent.calculation:
                      return Calculation();
                    case NavigationEvent.calculation1:
                      return Calculation1();
                    case NavigationEvent.calculation2:
                      return Calculation2();
                    case NavigationEvent.carsListing:
                      return CarsListing();
                    case NavigationEvent.carModelsListing:
                      return SelectedCarModelsListings();
                    case NavigationEvent.carCalculationsResult:
                      return const CarCostResults();
                    case NavigationEvent.originPage:
                      return const SelectOriginPlacePage();
                    case NavigationEvent.destPage:
                      return const SelectDestinationPlacePage();
                    default:
                      return SplashScreen();
                  }
                },
              ),

              // HomeScreen(),
              // body: Listing(),
              // body: Listing6(),
              // body: Results(),
              // body: SplashScreen(),
            ),
          );
        });
  }
}
