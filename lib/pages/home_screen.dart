import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090A0A),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentEvent: NavigationEvent.home,
   
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF090A0A),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 36),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF202325),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/vectors/ic_search_x2.svg',
                          width: 16,
                          height: 16,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Color(0xFF888888)),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 24),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        height: 1.5,
                        color: const Color(0xFFFFFFFF),
                      ),
                      children: [
                        TextSpan(
                          text: 'Hello,  ',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            height: 1.3,
                          ),
                        ),
                        TextSpan(
                          text: 'Kelvin !',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            height: 1.3,
                            color: const Color(0xFFFF3E47),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => navigationController
                        .navigateTo(NavigationEvent.carsListing),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(13, 0, 0, 37),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment(-0.585, -0.313),
                          end: Alignment(0.683, 0.583),
                          colors: <Color>[Color(0xFFF9346A), Color(0xFFFA7B40)],
                          stops: <double>[0, 1],
                        ),
                        // boxShadow: [
                        //   const BoxShadow(
                        //     color: Color(0x80FA7345),
                        //     offset: Offset(0, 4),
                        //     blurRadius: 12,
                        //   ),
                        // ],
                      ),
                      child: SizedBox(
                        width: 250,
                        height: 150,
                        child: Center(
                          child: Text(
                            'Car',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              height: 1,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigationController
                        .navigateTo(NavigationEvent.carsListing),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment(-0.488, -0.292),
                          end: Alignment(0.512, 0.562),
                          colors: <Color>[Color(0xFF6F5EFF), Color(0xFF69C3F8)],
                          stops: <double>[0.035, 1],
                        ),
                        // boxShadow: [
                        //   const BoxShadow(
                        //     color: Color(0x80705EFF),
                        //     offset: Offset(0, 4),
                        //     blurRadius: 12,
                        //   ),
                        // ],
                      ),
                      child: SizedBox(
                        width: 250,
                        height: 150,
                        child: Center(
                          child: Text(
                            'Calculation',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              height: 1,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
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
}
