import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlackCurvedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  BlackCurvedButton({required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    final priColor = Theme.of(context).secondaryHeaderColor;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 19, 0.7, 18),
          decoration: BoxDecoration(
            color: priColor,
            borderRadius: BorderRadius.circular(16), // Curved corners
          ),
          alignment: Alignment.center, // Center the text
          child: Text(
            title,
            style: GoogleFonts.getFont(
              'Roboto Condensed',
              fontWeight: FontWeight.w400,
              fontSize: 13,
              height: 1,
              letterSpacing: 0.1,
              // color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
