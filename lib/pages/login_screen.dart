import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/components/styled_email_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/gradient_button.dart';
import 'components/styled_password_text_field.dart';
import 'components/styled_username_text_field.dart';

class LoginScreen extends StatelessWidget {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  LoginScreen({super.key});
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
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Lets sign you in ',
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
                margin: const EdgeInsets.fromLTRB(12.5, 0, 12.5, 30),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 302.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientButton(
                          text: 'Sign In',
                          onPressed: () {
                            authController.signIn(
                                emailController.text, passwordController.text);
                          },
                          colors: const [
                            Color(0xFFA0398A),
                            Color(0xFFE23146),
                            Color(0xFFFF3E47)
                          ],
                        ),
                        InkWell(
                          onTap: () => navigationController
                              .navigateTo(NavigationEvent.signUp),
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
                                  'Sign Up',
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
              // Container(
              //   margin: const EdgeInsets.fromLTRB(0, 0, 7.1, 0),
              //   child: Align(
              //     alignment: Alignment.topCenter,
              //     child: Text(
              //       'Forgot password?',
              //       style: GoogleFonts.getFont(
              //         'Montserrat',
              //         fontWeight: FontWeight.w400,
              //         fontSize: 12,
              //         height: 1.5,
              //         color: const Color(0xFFE7121C),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
