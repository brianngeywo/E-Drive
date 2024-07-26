import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -27.4,
              right: -14.3,
              top: -14,
              bottom: -21,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: <Color>[Color(0xFF31333E), Color(0xFF000000)],
                    stops: <double>[0, 0.488],
                  ),
                ),
                child: Container(
                  width: 375,
                  height: 812,
                ),
              ),
            ),
            Positioned(
              right: -14.3,
              top: 30,
              child: SizedBox(
                width: 348,
                height: 828,
                child: SvgPicture.asset(
                  'assets/vectors/sign_board_x2.svg',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(27.4, 14, 14.3, 21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 136.1, 110),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF3E47),
                        borderRadius: BorderRadius.circular(73),
                      ),
                      child: Container(
                        width: 146,
                        height: 146,
                        padding: const EdgeInsets.fromLTRB(0, 19, 0, 27),
                        child: SizedBox(
                          width: 70,
                          height: 100,
                          child: SvgPicture.asset(
                            'assets/vectors/subtract_x2.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(33.9, 0, 0, 176.9),
                    child: Text(
                      'E-Drive',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 64,
                        letterSpacing: -0.2,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Define your onPressed functionality here
                      navigationController.navigateTo(NavigationEvent.login);
                      print('Button pressed');
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(65.9, 0, 0, 113.9),
                      width: 180,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(180),
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
                        child: SizedBox(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(7, 13, 0, 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      10, 0, 9.3, 2.2),
                                  child: Text(
                                    'Get Started',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      letterSpacing: -0.2,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 22.2,
                                  child: SizedBox(
                                    width: 24,
                                    height: 22.2,
                                    child: SvgPicture.asset(
                                      'assets/vectors/arrow_right_x2.svg',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(159.9, 0, 0, 0),
                    child: Text(
                      'Developed By Mwaniki Kelvin',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 1.6,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
