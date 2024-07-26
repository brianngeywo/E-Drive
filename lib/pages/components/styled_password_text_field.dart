import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledPasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const StyledPasswordTextField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 4.7, 24),
      decoration: BoxDecoration(
        color: const Color(0xFF090A0A),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: true,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(23, 15, 20, 14),
          border: InputBorder.none,
          hintText: 'Password',
          hintStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: const Color(0xFF72777A),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(23, 15, 10, 14),
            child: SvgPicture.asset(
              'assets/vectors/lock_key_x2.svg',
              width: 16,
              height: 16,
            ),
          ),
        ),
      ),
    );
  }
}
