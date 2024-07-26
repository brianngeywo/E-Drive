import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Color(0xFF202325), // Set the background color of the AppBar
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/vectors/sliders_horizontal_4_x2.svg',
              width: 32,
              height: 32,
            ),
            onPressed: onSettingsPressed,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
