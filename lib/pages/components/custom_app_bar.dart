import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() onBackPressed;
  final Function() onSettingsPressed;

  CustomAppBar({
    required this.onBackPressed,
    required this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor:
      //     Color(0xFF202325), // Set the background color of the AppBar
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/vectors/arrow_uup_left_13_x2.svg',
            width: 24,
            height: 24,
          ),
          onPressed: onBackPressed,
        ),
      ),
      actions: [
        ThemeToggleButton(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class ThemeToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: settingsController.themeMode == ThemeMode.dark,
      onChanged: (bool isDarkMode) {
        settingsController
            .updateThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
      },
      activeColor: const Color.fromARGB(255, 0, 92, 167),
      inactiveThumbColor: const Color.fromARGB(255, 255, 53, 53),
      inactiveTrackColor: const Color.fromARGB(255, 218, 118, 118),
    );
  }
}
