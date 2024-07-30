import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/controllers/settings_service.dart';
import 'package:google_fonts/google_fonts.dart';

class PlacesListTile extends StatelessWidget {
  final DataMap location;
  final VoidCallback onTap;

  PlacesListTile({
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    final gradient = customTheme?.usedGradient;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 39),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location['name'],
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        // color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      location['formattedAddress'],
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        // color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
