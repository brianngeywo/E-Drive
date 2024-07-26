import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/custom_bottom_navigation_bar.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        onBackPressed: () =>
            navigationController.navigateTo(NavigationEvent.home),
        onSettingsPressed: () {},
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentEvent: NavigationEvent.profile,
      ),
      body: Column(
        children: [
          carSummarySection(),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1E22),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SizedBox(
                    width: 165,
                    height: 208,
                    child: SvgPicture.asset(
                      'assets/vectors/map_1_x2.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1E22),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 16, 12, 27),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                width: 102,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 10, 22, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              'assets/images/ellipse_4.jpeg',
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          width: 64,
                                          height: 64,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 58),
                                      width: 16,
                                      height: 16,
                                      child: SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: SvgPicture.asset(
                                          'assets/vectors/xmlid_517_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(2, 0, 0, 12),
                            child: Text(
                              'Mwaniki Kelvin',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: -0.3,
                                color: const Color(0xFF838990),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                            child: Text(
                              'Driver ',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                letterSpacing: -0.3,
                                color: const Color(0xFF72777A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container carSummarySection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1D1E22),
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.fromLTRB(0, 0, 4, 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Toyota Mark X',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      height: 1.5,
                      color: const Color(0xFFEFEFEF),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/images/tesla_car_png_561.png',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'OWNED CAR ',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 2,
                    color: const Color(0xFF838990),
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
