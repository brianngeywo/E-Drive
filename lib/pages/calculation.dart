import 'package:flutter/material.dart';
import 'package:flutter_app/bff/fuel_types.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/custom_app_bar.dart';
import 'package:flutter_app/pages/components/custom_bottom_navigation_bar.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculation extends StatefulWidget {
  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () =>
            navigationController.navigateTo(NavigationEvent.carModelsListing),
        onSettingsPressed: () {},
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentEvent: NavigationEvent.calculation,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF090A0A),
        ),
        child: Column(
          children: [
            chooseFuelSection(),
            pricesAndBanner(),
          ],
        ),
      ),
    );
  }

  Container chooseFuelSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(17, 20, 17, 24),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose a Fuel',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: fuels
                    .map(
                      (item) => InkWell(
                        onTap: () {
                          fuelCostCalculationController.selectFuel(item);
                          navigationController
                              .navigateTo(NavigationEvent.calculation1);
                          print(item);
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 54.7, 0),
                          child: SizedBox(
                            width: 72.3,
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(13.8, 17, 0, 28.5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1D1E22),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    margin: const EdgeInsets.fromLTRB(
                                        5.2, 0, 5.2, 16),
                                    child: pumpIconMedium(),
                                  ),
                                  Text(
                                    item['title'].toString(),
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.8,
                                      height: 1.3,
                                      color: const Color(0xFFF2F4F5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox pumpIconMedium() {
    return SizedBox(
      width: 31,
      height: 30,
      child: Container(
        padding: const EdgeInsets.fromLTRB(6.1, 3.9, 14.8, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 10.1,
              height: 5.9,
              child: SizedBox(
                width: 10.1,
                height: 5.9,
                child: SvgPicture.asset(
                  'assets/vectors/vector_18_x2.svg',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 31,
                height: 30,
                child: SizedBox(
                  width: 31,
                  height: 30,
                  child: SvgPicture.asset(
                    'assets/vectors/group_7_x2.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container pricesAndBanner() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E22),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            epraBanner(),
            Container(
              margin: const EdgeInsets.fromLTRB(2, 0, 21, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: fuels
                      .map(
                        (item) => fuelPriceItem(
                          title: item['title'].toString(),
                          price: item['price'].toString(),
                        ),
                      )
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }

  Expanded fuelPriceItem({required String title, required String price}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 23, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF141414),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D0B0C1A),
              offset: Offset(0, 0),
              blurRadius: 6,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customPumpIconLarge(Colors.red),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color(0xFFFF3E47),
                    ),
                  ),
                  Text(
                    'Ksh $price',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.3,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container customPumpIconLarge(Color color) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4.7, 0, 0, 15),
      child: SizedBox(
        width: 50,
        height: 51,
        child: Container(
          padding: const EdgeInsets.fromLTRB(9.8, 6.7, 9.8, 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 16.3,
                height: 10,
                child: SizedBox(
                  width: 16.3,
                  height: 10,
                  child: SvgPicture.asset(
                    'assets/vectors/vector_19_x2.svg',
                    color: color,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 50,
                  height: 51,
                  child: SizedBox(
                    width: 50,
                    height: 51,
                    child: SvgPicture.asset(
                      'assets/vectors/group_x2.svg',
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container epraBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment(-0.605, 0),
            end: Alignment(0.691, 0),
            colors: <Color>[
              Color(0xFFA0398A),
              Color(0xFFE23146),
              Color(0xFFFF3E47)
            ],
            stops: <double>[0, 0.483, 1],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 45, 0, 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 39),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Prices are subjected to changes by',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 0.7,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 65,
                        height: 63,
                        child: SizedBox(
                          width: 65,
                          height: 63,
                          child: SvgPicture.asset(
                            'assets/vectors/group_4_x2.svg',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 8),
                        child: Text(
                          'EPRA',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 64,
                            height: 0.7,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
