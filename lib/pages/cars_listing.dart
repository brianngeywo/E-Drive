import 'package:flutter/material.dart';
import 'package:flutter_app/bff/list_of_cars.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/custom_app_bar.dart';
import 'package:flutter_app/pages/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CarsListing extends StatefulWidget {
  @override
  State<CarsListing> createState() => _CarsListingState();
}

class _CarsListingState extends State<CarsListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () => navigationController.navigateTo(NavigationEvent.home),
        onSettingsPressed: () {},
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentEvent: NavigationEvent.carsListing,
        // onTap: (index) {
        //   setState(() {
        //     _selectedIndex = index;
        //   });
        //   // Add your navigation logic here
        // },
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF090A0A),
        ),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 26),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    'Choose Your Car',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      letterSpacing: -0.3,
                      color: const Color(0xFFFF3E47),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: parentCars
                  .map(
                    (item) => carListTile(item),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget carListTile(DataMap car) {
    return InkWell(
      onTap: () {
        fuelCostCalculationController.selectParentCar(car);
        navigationController.navigateTo(NavigationEvent.carModelsListing);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.684, 0.147), // Starting point of the gradient
              end: Alignment(0.701, 0.147), // Ending point of the gradient
              colors: <Color>[
                Color(0xFF1D1E22), // Starting color
                Color(0xFF1A1B1E), // Intermediate color 1
                Color(0xFF17181B), // Intermediate color 2
                Color(0xFF141516), // Intermediate color 3
                Color(0xFF111213), // Intermediate color 4
                Color(0xFF0E0F10), // Intermediate color 5
                Color(0xFF0B0C0D), // Intermediate color 6
                Color(0xFF08090A), // Intermediate color 7
                Color(0xFF050607), // Intermediate color 8
                Color(0xFF020304), // Intermediate color 9
                Colors.black, // Ending color
              ],
              stops: <double>[
                0.0, // Position of the starting color
                0.1, // Position of the intermediate color 1
                0.2, // Position of the intermediate color 2
                0.3, // Position of the intermediate color 3
                0.4, // Position of the intermediate color 4
                0.5, // Position of the intermediate color 5
                0.7, // Position of the intermediate color 6
                0.8, // Position of the intermediate color 7
                0.85, // Position of the intermediate color 8
                0.95, // Position of the intermediate color 9
                1.0, // Position of the ending color
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 39),
            child: Text(
              car['name'],
              style: GoogleFonts.getFont(
                'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
