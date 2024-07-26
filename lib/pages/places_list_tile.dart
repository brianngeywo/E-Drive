import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PlacesListTile extends StatelessWidget {
  final DataMap location;
  final VoidCallback onTap;

  PlacesListTile({
    required this.location, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      location['formattedAddress'],
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xFFFFFFFF),
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
