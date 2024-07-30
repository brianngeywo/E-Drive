import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/settings_service.dart';
import 'package:flutter_app/static_data/list_of_cars.dart';
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
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    final gradient = customTheme?.usedGradient;

    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () =>
            navigationController.navigateTo(NavigationEvent.home),
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
            // color: Color(0xFF090A0A),
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
                    (item) => carListTile(item, gradient),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget carListTile(DataMap car, LinearGradient? gradient) {
    return InkWell(
      onTap: () {
        fuelSelectionService.selectParentCar(car);
        navigationController.navigateTo(NavigationEvent.carModelsListing);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 39),
            child: Text(
              car['name'],
              style: GoogleFonts.getFont(
                'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                // color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
