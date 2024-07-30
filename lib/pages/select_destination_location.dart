import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/custom_app_bar.dart';
import 'package:flutter_app/pages/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'places_list_tile.dart';

class SelectDestinationPlacePage extends StatefulWidget {
  const SelectDestinationPlacePage({super.key});

  @override
  State<SelectDestinationPlacePage> createState() =>
      _SelectDestinationStatePlacePage();
}

class _SelectDestinationStatePlacePage
    extends State<SelectDestinationPlacePage> {
  TextEditingController location_controller = TextEditingController();
  @override
  void initState() {
    searchLocationController.clearSearchLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).secondaryHeaderColor;
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () =>
            navigationController.navigateTo(NavigationEvent.calculation1),
        onSettingsPressed: () {},
      ),
      // backgroundColor: const Color(0xFF090A0A),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentEvent: NavigationEvent.originPage,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 36),
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: location_controller,
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
                  // hintStyle: const TextStyle(color: Color(0xFF888888)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                ),
                // style: const TextStyle(color: Colors.white),
                onChanged: (value) async {
                  await searchLocationController
                      .getAutocompleteSuggestions(value);
                },
              ),
            ),
          ),
          StreamBuilder<List<DataMap>>(
              stream: searchLocationController.locations,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  final _locations = snapshot.data;
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _locations!.length,
                      itemBuilder: (context, index) {
                        var _location = _locations[index];
                        return PlacesListTile(
                          location: _location,
                          onTap: () {
                            navigationController
                                .navigateTo(NavigationEvent.calculation1);
                            locationService.saveDestinationLocation(_location);
                            print(_location);
                          },
                        );
                      });
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.withOpacity(0.1),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Type to search for a location',
                          style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
