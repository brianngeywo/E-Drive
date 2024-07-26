import 'package:flutter/material.dart';
import 'package:flutter_app/bff/list_of_cars.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/custom_app_bar.dart';
import 'package:flutter_app/pages/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedCarModelsListings extends StatefulWidget {
  SelectedCarModelsListings({super.key});

  @override
  State<SelectedCarModelsListings> createState() =>
      _SelectedCarModelsListingsState();
}

class _SelectedCarModelsListingsState extends State<SelectedCarModelsListings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () =>
            navigationController.navigateTo(NavigationEvent.carsListing),
        onSettingsPressed: () {},
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
          currentEvent: NavigationEvent.carModelsListing),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF090A0A),
        ),
        child: StreamBuilder<DataMap>(
            stream: fuelCostCalculationController.parentCarStream,
            builder: (context, snapshot) {
              final car = snapshot.data;
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 26),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            car!['name'] + ' Models',
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
                      children: carModels
                          .where((model) => model['parent_car_id'] == car['id'])
                          .map(
                            (item) => carModelListTile(item),
                          )
                          .toList(),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      )),
                );
              }
            }),
      ),
    );
  }

  Widget carModelListTile(DataMap carModel) {
    return InkWell(
      onTap: () {
        fuelCostCalculationController.selectCarModel(carModel);
        navigationController.navigateTo(NavigationEvent.calculation);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.684, 0.147),
              end: Alignment(0.701, 0.147),
              colors: <Color>[Color(0xFF1D1E22), Color(0x00141414)],
              stops: <double>[0, 1],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 39),
            child: Text(
              carModel['name'],
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
