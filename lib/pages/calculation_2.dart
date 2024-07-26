import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/calculation_1.dart';
import 'package:flutter_app/pages/components/custom_app_bar.dart';
import 'package:flutter_app/pages/components/custom_bottom_navigation_bar.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/black_curved_button.dart';
import 'components/car_on_road_widget.dart';

class Calculation2 extends StatefulWidget {
  @override
  State<Calculation2> createState() => _Calculation2State();
}

class _Calculation2State extends State<Calculation2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () =>
            navigationController.navigateTo(NavigationEvent.calculation1),
        onSettingsPressed: () {},
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentEvent: NavigationEvent.calculation2,
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 170, minHeight: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                          stream: fuelCostCalculationController
                              .parentCarModelStream,
                          builder: (context, snapshot) {
                            final carModel = snapshot.data!;
                            return inforCardWidget(
                              title: 'Car',
                              inforItems: [
                                StreamBuilder(
                                    stream: fuelCostCalculationController
                                        .parentCarStream,
                                    builder: (context, snapshot) {
                                      final car = snapshot.data!;
                                      return Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 2),
                                        child: inforIconText(
                                            asset:
                                                'assets/vectors/vector_12_x2.svg',
                                            text: car['name'],
                                            imageIsAsset: false),
                                      );
                                    }),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: inforIconText(
                                      asset: 'assets/vectors/vector_7_x2.svg',
                                      text: carModel['name'],
                                      imageIsAsset: false),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: inforIconText(
                                      asset: 'assets/vectors/group_8_x2.svg',
                                      text:
                                          "${carModel['fuel_tank_capacity']} L",
                                      imageIsAsset: false),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: inforIconText(
                                      asset: 'assets/vectors/group_6_x2.svg',
                                      text:
                                          "${carModel['fuel_efficiency']} km/L",
                                      imageIsAsset: false),
                                ),
                              ],
                            );
                          }),
                      inforCardWidget(
                        title: 'Route',
                        inforItems: [
                          StreamBuilder(
                              stream: fuelCostCalculationController
                                  .originLocationStream,
                              builder: (context, snapshot) {
                                return Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: inforIconText(
                                      asset:
                                          'assets/vectors/subtract_stroke_x2.svg',
                                      text: snapshot.data!['name'],
                                      imageIsAsset: false),
                                );
                              }),
                          StreamBuilder(
                              stream: fuelCostCalculationController
                                  .destinationLocationStream,
                              builder: (context, snapshot) {
                                return Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: inforIconText(
                                      asset:
                                          'assets/vectors/subtract_stroke_1_x2.svg',
                                      text: snapshot.data!['name'],
                                      imageIsAsset: false),
                                );
                              }),
                        ],
                      ),
                      StreamBuilder(
                          stream: fuelCostCalculationController
                              .selectedFuelTypeStream,
                          builder: (context, snapshot) {
                            return inforCardWidget(
                              title: 'Fuel',
                              inforItems: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: inforIconText(
                                      asset: 'assets/vectors/group_3_x2.svg',
                                      text: "${snapshot.data!['price']} Ksh",
                                      imageIsAsset: false),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: inforIconText(
                                      asset: 'assets/vectors/vector_2_x2.svg',
                                      text: snapshot.data!['title'],
                                      imageIsAsset: false),
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
              const CarOnRoadWidget(),
              routeSummary(),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: BlackCurvedButton(
                  onPressed: () {
                    navigationController
                        .navigateTo(NavigationEvent.carCalculationsResult);
                  },
                  title: 'Calculate',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget routeSummary() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        height: 180,
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0.1, 0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE9EAF4),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Stack(
              children: [
                const SizedBox(
                  width: 200,
                  height: 220,
                ),
                Positioned(
                  top: 5,
                  left: 10,
                  child: StreamBuilder(
                      stream:
                          fuelCostCalculationController.originLocationStream,
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 8, 19, 8),
                              width: 24,
                              height: 24,
                              child: SizedBox(
                                width: 16,
                                height: 18,
                                child: SvgPicture.asset(
                                  'assets/vectors/subtract_stroke_1_x2.svg',
                                ),
                              ),
                            ),
                            Text(
                              snapshot.data!['name'],
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                height: 2,
                                color: const Color(0xFF000000),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                const Positioned(
                  left: 50,
                  top: 45,
                  child: SizedBox(
                    height: 80,
                    child: VerticalDivider(
                      thickness: 2,
                      width: 20,
                    ),
                  ),
                ),
                Positioned(
                  left: 80,
                  top: 60,
                  child: Text(
                    'Route',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      height: 1.3,
                      letterSpacing: -0.4,
                      color: const Color.fromARGB(255, 82, 85, 100),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 125,
                  child: StreamBuilder(
                      stream: fuelCostCalculationController
                          .destinationLocationStream,
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 8, 19, 8),
                              width: 24,
                              height: 24,
                              child: SizedBox(
                                width: 16,
                                height: 18,
                                child: SvgPicture.asset(
                                  'assets/vectors/subtract_stroke_2_x2.svg',
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                snapshot.data!['name'],
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  height: 2,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inforCardWidget(
      {required String title, required List<Widget> inforItems}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 120,
        maxWidth: 125,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE9EAF4),
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.only(left: 6),
        // width: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.6,
                    letterSpacing: -0.4,
                    color: const Color(0xFF6A6F87),
                  ),
                ),
              ),
            ),
            const Divider(),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: inforItems),
          ],
        ),
      ),
    );
  }

  Align inforIconText(
      {required String asset,
      required String text,
      required bool imageIsAsset}) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageIsAsset
              ? Container(
                  margin: const EdgeInsets.fromLTRB(0, 3.6, 6, 4.2),
                  width: 18,
                  height: 18,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          asset,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.fromLTRB(0, 3.6, 6, 4.2),
                  width: 18,
                  height: 15,
                  child: SizedBox(
                    width: 18,
                    height: 14.2,
                    child: SvgPicture.asset(asset),
                  ),
                ),
          Text(
            text,
            style: GoogleFonts.getFont(
              'Roboto Condensed',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.6,
              letterSpacing: 0.2,
              color: const Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}
