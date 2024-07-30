import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/gradient_button.dart';
import 'package:flutter_app/pages/components/styled_password_text_field.dart';
import 'package:flutter_app/pages/components/styled_username_text_field.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/styled_email_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[
              Color(0xFF31333E),
              Color(0xFF2A2C36),
              Color(0xFF23252E),
              Color(0xFF1C1E26),
              Color(0xFF15171E),
              Color(0xFF0E1016),
              Color(0xFF07080D),
              Color(0xFF000000),
            ],
            stops: <double>[0, 0.3, 0.5, 0.65, 0.8, 0.9, 0.95, 1],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 375,
              //   height: 516,
              //   child: SvgPicture.asset(
              //     'assets/vectors/mask_group_x2.svg',
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.fromLTRB(7.6, 0, 0, 4),
                child: SizedBox(
                  width: 70,
                  height: 100,
                  child: SvgPicture.asset(
                    'assets/vectors/subtract_3_x2.svg',
                  ),
                ),
              ),

              Text(
                'E-Drive',
                style: GoogleFonts.getFont(
                  'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 60,
                  letterSpacing: -0.2,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(3, 0, 3, 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Register',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      height: 1.5,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              StyledUsernameTextField(
                icon: 'assets/vectors/user_x2.svg',
                controller: usernameController,
                onChanged: (value) {
                  // Handle username changes
                },
              ),
              StyledEmailTextField(
                icon: 'assets/vectors/envelope_simple_x2.svg',
                controller: emailController,
                onChanged: (value) {
                  // Handle username changes
                },
              ),
              StyledPasswordTextField(
                controller: passwordController,
                onChanged: (value) {
                  // Handle password changes
                },
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(9.5, 0, 9.5, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 305.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientButton(
                          text: 'Sign Up',
                          onPressed: () {
                            // Call the signUp method
                            authController.signUp(
                              emailController.text,
                              passwordController.text,
                              usernameController.text,
                            );
                          },
                          colors: <Color>[
                            const Color(0xFFA0398A),
                            const Color(0xFFE23146),
                            const Color(0xFFFF3E47)
                          ],
                        ),
                        InkWell(
                          onTap: () => navigationController
                              .navigateTo(NavigationEvent.login),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(180),
                            ),
                            child: Container(
                              width: 142,
                              padding: const EdgeInsets.fromLTRB(0, 15, 1, 13),
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    letterSpacing: -0.2,
                                    color: const Color(0xFFFF3E47),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(4.8, 20, 0, 0),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 1.5,
                      color: const Color(0xFF6C7072),
                    ),
                    children: [
                      TextSpan(
                        text: 'By Signing you agree to our',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: ' Terms of use ',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.3,
                          color: const Color(0xFFE7121C),
                        ),
                      ),
                    ],
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
