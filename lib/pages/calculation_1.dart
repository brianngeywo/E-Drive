import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/custom_app_bar.dart';
import 'package:flutter_app/pages/components/custom_bottom_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/black_curved_button.dart';
import 'components/plain_text_field.dart';

class Calculation1 extends StatefulWidget {
  @override
  State<Calculation1> createState() => _Calculation1State();
}

class _Calculation1State extends State<Calculation1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () => navigationController.navigateTo(NavigationEvent.calculation),
        onSettingsPressed: () {},
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentEvent: NavigationEvent.calculation1,
      ),
      body: Column(
        children: [
          mapImage(),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xFFA0398A),
                      Color(0xFFC0346F), // Intermediate color
                      Color(0xFFC0346F), // Intermediate color
                      Color(0xFFD53353), // Intermediate color
                    ],
                    stops: [0.0, 0.33, 0.66, 1.0],
                  ),
                ),
                child: Column(
                  children: [
                    selectRouteSection(),
                    selectedRouteActions(),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Container mapImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/screenshot_202406301537561.jpeg',
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 249,
      ),
    );
  }

  Container selectedRouteActions() {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 8.7, 0),
        child: BlackCurvedButton(
          onPressed: () =>
              navigationController.navigateTo(NavigationEvent.calculation2),
          title: 'Confirm destination',
        ));
  }

  Column selectRouteSection() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 30, 0, 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Text(
                'Select your Route',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  letterSpacing: 0.4,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x80FFFFFF),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder(
                    stream: dataSubjects.originLocationStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return InkWell(
                          onTap: () => navigationController
                              .navigateTo(NavigationEvent.originPage),
                          child: Center(
                            child: SizedBox(
                              height: 70,
                              child: PlainTextField(
                                label: snapshot.data!['name'],
                                prefix: "assets/vectors/subtract_stroke_x2.svg",
                              ),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () => navigationController
                              .navigateTo(NavigationEvent.originPage),
                          child: const Center(
                            child: SizedBox(
                              height: 70,
                              child: PlainTextField(
                                label: "Origin",
                                prefix:
                                    "assets/vectors/subtract_stroke_1_x2.svg",
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.5),
                  width: 311,
                  height: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFC8C7CC),
                    ),
                    child: Container(
                      width: 270,
                      height: 0.5,
                    ),
                  ),
                ),
                StreamBuilder(
                    stream:
                        dataSubjects.destinationLocationStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return InkWell(
                          onTap: () => navigationController
                              .navigateTo(NavigationEvent.destPage),
                          child: Center(
                            child: SizedBox(
                              height: 70,
                              child: PlainTextField(
                                label: snapshot.data!['name'],
                                prefix:
                                    "assets/vectors/subtract_stroke_1_x2.svg",
                              ),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () => navigationController
                              .navigateTo(NavigationEvent.destPage),
                          child: const Center(
                            child: SizedBox(
                              height: 70,
                              child: PlainTextField(
                                label: "Destination",
                                prefix:
                                    "assets/vectors/subtract_stroke_1_x2.svg",
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CarSelectionReminder extends StatelessWidget {
  final VoidCallback onSelectCarPressed;
  final String message;

  const CarSelectionReminder(
      {Key? key, required this.onSelectCarPressed, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.warning,
          color: Colors.orange,
          size: 40,
        ),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        BlackCurvedButton(
          onPressed: onSelectCarPressed,
          title: 'Proceed',
        ),
      ],
    );
  }
}
