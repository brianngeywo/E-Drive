import 'package:flutter/material.dart';

class CarOnRoadWidget extends StatelessWidget {
  const CarOnRoadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 466,
        height: 200,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/road_052.png',
                      ),
                    ),
                  ),
                  child: Container(
                    width: 466,
                    height: 150,
                  ),
                ),
              ),
              Positioned(
                top: -10,
                left: 80,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/th_13.png',
                      ),
                    ),
                  ),
                  child: Container(
                    width: 169,
                    height: 88,
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
