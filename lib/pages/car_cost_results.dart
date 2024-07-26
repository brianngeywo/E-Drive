import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/car_on_road_widget.dart';
import 'package:flutter_app/pages/components/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CarCostResults extends StatefulWidget {
  const CarCostResults({super.key});

  @override
  State<CarCostResults> createState() => _CarCostResultsState();
}

class _CarCostResultsState extends State<CarCostResults> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculationController.calculateTotalCost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () =>
            navigationController.navigateTo(NavigationEvent.calculation2),
        onSettingsPressed: () {},
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 56,
              child: InkWell(
                onTap: () =>
                    navigationController.navigateTo(NavigationEvent.home),
                child: SizedBox(
                  width: 327,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                      child: Center(
                        child: Text(
                          'Quit',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            height: 1.3,
                            letterSpacing: -0.4,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
                left: 0, right: 0, top: 70, child: CarOnRoadWidget()),
            Positioned(
              left: 0,
              right: 0,
              bottom: 287,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: <Color>[Color(0xFFEB394D), Color(0xFFA83983)],
                    stops: <double>[0, 1],
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 16.5, 0, 20),
                    child: Column(
                      children: [
                        Text(
                          'Kshs ${calculationController.totalCost.value}',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 1.5,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/icons_8_expensive_price_501.png',
                                    ),
                                  ),
                                ),
                                child: const SizedBox(
                                  width: 37,
                                  height: 37,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
                              child: Text(
                                'Total cost ',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  height: 1.3,
                                  letterSpacing: -0.4,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
