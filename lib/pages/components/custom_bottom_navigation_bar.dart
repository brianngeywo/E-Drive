import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationEvent currentEvent;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem('assets/icons/home.svg', NavigationEvent.home),
          _buildNavItem('assets/icons/chart.svg', NavigationEvent.carsListing),
          _buildNavItem(
              'assets/icons/location.svg', NavigationEvent.calculation1),
          _buildNavItem('assets/icons/profile.svg', NavigationEvent.profile),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconPath, NavigationEvent event) {
    return IconButton(
      icon: SvgPicture.asset(
        iconPath,
        color: currentEvent == event
            ? const Color(0xFF979C9E)
            : const Color(0xFF979C9E).withOpacity(0.5),
        width: 24,
        height: 24,
      ),
      onPressed: () => navigationController.navigateTo(event),
    );
  }
}
