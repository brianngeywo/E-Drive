import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> colors;

  const GradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.colors = const [
      Color(0xFFA0398A),
      Color(0xFFE23146),
      Color(0xFFFF3E47)
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 1, 17.5, 1),
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(180),
        gradient: LinearGradient(
          begin: const Alignment(-0.605, 0),
          end: const Alignment(0.691, 0),
          colors: colors,
          stops: const [0, 0.483, 1],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(180),
          ),
          padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            letterSpacing: -0.2,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
